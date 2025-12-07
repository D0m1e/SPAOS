Name: calculate-files
Version: 1.0
Release: 1%{?dist}
Summary: Script to count files in /etc
License: MIT
Source0: calculate-files.bash
Requires: /bin/bash

%description
This RPM package provides a Bash script to count the number of files in the /etc directory, excluding directories and links.

%prep
# No preparation needed

%build
# No build steps needed

%install
# Create the install directory
mkdir -p %{buildroot}/usr/local/bin

# Copy the script to the install directory
install -m 0755 %{SOURCE0} %{buildroot}/usr/local/bin/calculate-files

%files
/usr/local/bin/calculate-files

%changelog
* Sun Dec 7 2025 Dmytro dimabbr365@gmail.com - 1.0-1
- Initial release
