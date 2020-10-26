package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"time"
)

var BASE = "/workspace/ryan/todos"

func runEditor(file string) {
	editor := os.Getenv("EDITOR")
	cmd := exec.Command(editor, file)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	err := cmd.Run()
	if err != nil {
		log.Fatal("failed running editor:", err)
	}
}

type DateParts struct {
	baseDir string
	year    string
	month   string
	day     string
}

func NewDateParts(t time.Time) DateParts {
	homeDir, err := os.UserHomeDir()
	if err != nil {
		log.Fatal("can't determine user's home directory:", err)
	}

	return DateParts{
		baseDir: homeDir + BASE,
		year:    strconv.Itoa(t.Year()),
		month:   t.Format("01-Jan"),
		day:     t.Format("02-Mon"),
	}
}

func (dp *DateParts) YearDirPath() string {
	return filepath.Join(dp.baseDir, dp.year)
}

func (dp *DateParts) MonthDirPath() string {
	return filepath.Join(dp.YearDirPath(), dp.month)
}

func (dp *DateParts) DayFilePath() string {
	return filepath.Join(dp.MonthDirPath(), dp.day+".md")
}

// Go to the  month dir and grab all of the date files
// If there are other files before today then see which one is the closest before
// Otherwise check the previous month in this year if one exists
// Otherwise check the previous year
func previous(dp DateParts) (string, error) {
	files, err := ioutil.ReadDir(dp.MonthDirPath())
	if err != nil {
		log.Fatal("failed reading month directory to find prev:", err)
	}

	// There are other files this month. Just grab the second to last.
	if len(files) > 1 {
		f := files[len(files)-2]
		return filepath.Join(dp.MonthDirPath(), f.Name()), nil
	}

	// Otherwise go check the whole year to get the previous month that exists.
	dirs, err := ioutil.ReadDir(dp.YearDirPath())
	if err != nil {
		log.Fatal("failed reading year directory to find prev:", err)
	}

	if len(dirs) > 1 {
		d := dirs[len(dirs)-2]
		prevMonthPath := filepath.Join(dp.YearDirPath(), d.Name())
		// Check the previous month for files. If it has some return the last one.
		files, err := ioutil.ReadDir(prevMonthPath)
		if err != nil {
			log.Fatal("failed reading month directory to find prev:", err)
		}
		if len(files) > 0 {
			f := files[len(files)-1]
			return filepath.Join(prevMonthPath, f.Name()), nil
		}
	}

	// TODO: implement checking previous year
	return "", errors.New("failed to identify a previous todo file")
}

func main() {
	now := time.Now()
	dp := NewDateParts(now)

	if _, err := os.Stat(dp.YearDirPath()); os.IsNotExist(err) {
		os.Mkdir(dp.YearDirPath(), 0755)
	}

	if _, err := os.Stat(dp.MonthDirPath()); os.IsNotExist(err) {
		os.Mkdir(dp.MonthDirPath(), 0755)
	}

	if _, err := os.Stat(dp.DayFilePath()); os.IsNotExist(err) {
		fileHeaderDate := now.Format("Monday, January 2 2006")
		fileHeader := fmt.Sprintf("TODOs for %s", fileHeaderDate)
		err := ioutil.WriteFile(dp.DayFilePath(), []byte(fileHeader), 0644)
		if err != nil {
			log.Fatal("failed to make new todo file:", err)
		}
	}

	if len(os.Args) > 1 && os.Args[1] == "prev" {
		prevPath, err := previous(dp)
		if err != nil {
			log.Fatal(err)
		}

		runEditor(prevPath)
	} else {
		runEditor(dp.DayFilePath())
	}
}
