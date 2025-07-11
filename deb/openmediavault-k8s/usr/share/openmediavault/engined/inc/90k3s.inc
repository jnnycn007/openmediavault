<?php
/**
 * This file is part of OpenMediaVault.
 *
 * @license   https://www.gnu.org/licenses/gpl.html GPL Version 3
 * @author    Volker Theile <volker.theile@openmediavault.org>
 * @copyright Copyright (c) 2009-2025 Volker Theile
 *
 * OpenMediaVault is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OpenMediaVault is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenMediaVault. If not, see <https://www.gnu.org/licenses/>.
 */
require_once("openmediavault/functions.inc");

\OMV\System\LogFileSpec::registerSpecification("k3s", [
	"command" => "export SYSTEMD_COLORS=0; journalctl --quiet --no-pager ".
		"SYSLOG_IDENTIFIER='k3s' --output=short-iso",
	"filename" => "k3s.log",
	"regex" => "/^(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[+-]\d{4})\s+(\S+)\s+k3s\[\d+\]:\s+(.*)$/",
	"columns" => [
		"ts" => [
			"index" => 1,
			"func" => function($v) { return strpdate($v,"Y-m-d*H:i:sT"); }
		],
		"date" => [
			"index" => 1,
			"func" => function($v) {
				return strftime("%c", strpdate($v,"Y-m-d*H:i:sT"));
			}
		],
		"hostname" => 2,
		"message" => 3
	]
]);
