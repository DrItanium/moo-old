;------------------------------------------------------------------------------
;moo
;Copyright (C) 2013 Joshua Scoggins 
;
;This program is free software: you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.
;
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.
;
;You should have received a copy of the GNU General Public License
;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;------------------------------------------------------------------------------
; ComputerInterface.clp - Defines the methods, functions, globals, and classes
; associated with the terminals
;
; Written by Joshua Scoggins
;------------------------------------------------------------------------------
(defclass MAIN::static-preprocessed-terminal-data 
  (is-a Object has-flags)
  (role concrete)
  (slot total-length
        (type INTEGER))
  (slot lines-per-page
        (type INTEGER))
  (slot grouping-count
        (type INTEGER))
  (slot font-changes-count
        (type INTEGER)))
;------------------------------------------------------------------------------

(defclass MAIN::view-terminal-data
  (is-a Object)
  (slot top)
  (slot left)
  (slot bottom)
  (slot right)
  (slot vertical-offset))

;------------------------------------------------------------------------------
(defclass MAIN::map-terminal
  (is-a Object)
  (slot logical-name
        (type SYMBOL))
  (slot length
        (type INTEGER)))

;------------------------------------------------------------------------------
(defclass MAIN::terminal-groupings
  (is-a Object has-flags)
  (role concrete)
  (slot type
        (type SYMBOL)
        (default ?NONE))
  (slot permutation
        (type INTEGER))
  (slot start-index
        (type INTEGER))
  (slot length
        (type INTEGER))
  (slot maximum-line-count
        (type INTEGER)))

;------------------------------------------------------------------------------
(defclass MAIN::text-face-data
 (is-a Object)
 (slot index
  (type INTEGER))
 (slot face)
 (slot color))
