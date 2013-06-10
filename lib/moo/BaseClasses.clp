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
; BaseClasses.clp - Base classes that provide a way to automate certain
; parts of the marathon-infinity => moo translation 
;
; Written by Joshua Scoggins
;------------------------------------------------------------------------------
(defclass MAIN::has-flags 
  "A interface class that declares that the given class has a flags field"
  (is-a USER)
  (role abstract)
  (multislot flags
             (source composite)
             (visibility public)))
;------------------------------------------------------------------------------
