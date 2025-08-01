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

omv_config_add_node "/config/system" "sharedfoldersnapshotlifecycle"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "enable" "0"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "retentionperiod" "1800"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limitcustom" "10"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limithourly" "24"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limitdaily" "7"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limitweekly" "4"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limitmonthly" "12"
omv_config_add_key "/config/system/sharedfoldersnapshotlifecycle" "limityearly" "1"

exit 0
