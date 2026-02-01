# TODO
- reduce time to key repeat
- better lock screen
- border colors
- gtk themes

# Additional Steps
- systemctl --user enable pipewire-pulse
- sudo systemctl enable bluetooth.service
- download 1password for linux and follow the install steps: https://support.1password.com/install-linux/#get-1password-for-linux
- systemctl status systemd-networkd.service, systemd-resolved.service, and dhcpcd.service and disable if enabled. Then systemctl enable --now NetworkManager.service.

### Arch Install Config
- ext4
- NetworkManager
- hyprland
- sddm

### Notes
- Nice waybar config example: https://github.com/elifouts/Dotfiles/blob/main/.config/waybar/themes/default/config-default

### Secure Boot
Link: https://www.reddit.com/r/archlinux/comments/13d7rec/setting_up_secure_boot_while_dual_booting_windows/
```
# Create keys
sudo sbctl create-keys

# Register them with BIOS, along with Microsoft vendor keys
sudo sbctl enroll-keys -m

# Sign the kernel and refind EFI files.
sudo sbctl sign -s /boot/vmlinuz-linux
sudo sbctl sign -s /boot/EFI/refind/refind_x64.efi

# Verify everything has been signed and reboot
sudo sbctl verify
sudo reboot
```
