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
; Run.clp - Starts up moo and associated adventure-engine libraries 
; Written by Joshua Scoggins
;------------------------------------------------------------------------------
(initialize-adventure-engine)
;------------------------------------------------------------------------------
(load-application "moo")
; We've loaded the application, it's time to call reset to make sure that
; everything gets loaded correctly into working memory
(reset)
