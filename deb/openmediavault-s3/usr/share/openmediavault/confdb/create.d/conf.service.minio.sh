#!/usr/bin/env dash
#
# This file is part of OpenMediaVault.
#
# @license   https://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    Volker Theile <volker.theile@openmediavault.org>
# @copyright Copyright (c) 2009-2025 Volker Theile
#
# OpenMediaVault is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# OpenMediaVault is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OpenMediaVault. If not, see <https://www.gnu.org/licenses/>.

set -e

. /usr/share/openmediavault/scripts/helper-functions

########################################################################
# Update the configuration.
# <config>
#   <services>
#     <minio>
#       <enable>0|1</enable>
#       <port>9000</port>
#       <consoleport>9001</consoleport>
#       <consolesslcertificateref></consolesslcertificateref>
#       <rootname>admin</rootname>
#       <rootpassword>openmediavault</rootpassword>
#       <sharedfolderref></sharedfolderref>
#     </minio>
#   </services>
# </config>
########################################################################
if ! omv_config_exists "/config/services/minio"; then
	omv_config_add_node "/config/services" "minio"
	omv_config_add_key "/config/services/minio" "enable" "0"
	omv_config_add_key "/config/services/minio" "port" "9000"
	omv_config_add_key "/config/services/minio" "consoleport" "9001"
	omv_config_add_key "/config/services/minio" "consolesslcertificateref" ""
	omv_config_add_key "/config/services/minio" "rootname" "admin"
	omv_config_add_key "/config/services/minio" "rootpassword" "openmediavault"
	omv_config_add_key "/config/services/minio" "sharedfolderref" ""
fi

exit 0
