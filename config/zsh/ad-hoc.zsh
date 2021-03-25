HOMEWORK_DIR="$HOME/workspace/adhoc/homework/homework_answers"

alias adhoc="cd $HOME/workspace/adhoc"
alias homework="cd $HOMEWORK_DIR"
alias vslcsp="bash $HOMEWORK_DIR/assignments/slcsp/validate.sh"
alias vproto="cat $HOMEWORK_DIR/assignments/proto/answers"
alias cpproto="cp $HOMEWORK_DIR/assignments/proto/txnlog.dat ."
alias vfetch="git diff $HOMEWORK_DIR/assignments/fetch/test/api/managed-record-test.js test/api/managed-record-test.js"

vhhbuild(){
  cp "$HOMEWORK_DIR/assignments/hhbuilder/evaluate.html" evaluate.html
  cp -r "$HOMEWORK_DIR/assignments/hhbuilder/jasmine" jasmine          
  diff -s index.html "$HOMEWORK_DIR/assignments/hhbuilder/index.html"  
  npx es-check es5 index.js 
}

grade_local() {
  grading_dir="$HOME/workspace/adhoc/homework/grading"
  echo "Deleting current grading directory: $grading_dir"
  rm -rf "$grading_dir"

  echo "Making new grading directory: $grading_dir"
  mkdir $grading_dir

  new_download=$(ls -lt ~/Downloads | tail -n +2 | head -1 | awk '{print $9}')
  echo "Moving $new_download to $grading_dir"
  mv ~/Downloads/$new_download $grading_dir

  echo "Unzipping..."
  cd $grading_dir
  unzip $new_download

  echo "Done!"
}

grade() {
  submission=$1

  grading_dir="$HOME/workspace/adhoc/homework/grading"
  echo "Deleting current grading directory: $grading_dir"
  rm -rf "$grading_dir"

  echo "Making new grading directory: $grading_dir"
  mkdir $grading_dir

  mv ~/Downloads/$submission.zip $grading_dir
  cd $grading_dir

  echo "Unzipping..."
  mkdir $submission
  cd $submission
  unzip ../$submission.zip
  cd ..
  rm $submission.zip

  echo "Copying submission to remote host"
  scp -r $submission homeworkgrading.com:~

  echo "Done!"
}
