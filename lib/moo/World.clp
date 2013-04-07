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
; World.clp - Contains definitions for the world representation. This file 
; is a port of the information found in world.c and world.h in the marathon
; infinity source code
;
; Written by Joshua Scoggins
;------------------------------------------------------------------------------
;Constants
;------------------------------------------------------------------------------
(defglobal MAIN 
	   ?*trig-shift* = 10
	   ?*trig-magnitude* = (left-shift 1 ?*trig-shift*)

	   ?*angular-bits* = 9
	   ?*number-of-angles* = (cast-as-short (left-shift 1 ?*angular-bits*))
	   ?*full-circle* = ?*number-of-angles*
	   ?*quarter-circle* = (cast-as-short (div ?*number-of-angles* 4))
	   ?*half-circle* = (cast-as-short (div ?*number-of-angles* 2))
	   ?*three-quarter-circle* = (cast-as-short (div (* ?*number-of-angles* 3) 4))
	   ?*eighth-circle* = (cast-as-short (div ?*number-of-angles* 8))
	   ?*sixteenth-circle* = (cast-as-short (div ?*number-of-angles* 16))

	   ?*world-fractional-bits* = 10
	   ?*world-one* = (cast-as-short (left-shift 1 ?*world-fractional-bits*))
	   ?*world-one-half* = (cast-as-short (div ?*world-one* 2))
	   ?*world-one-fourth* = (cast-as-short (div ?*world-one* 4))
	   ?*world-three-fourths* = (cast-as-short (div (* ?*world-one) 3) 4)
	   ?*default-random-seed* = 65005

	   )
;------------------------------------------------------------------------------
