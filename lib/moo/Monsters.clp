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
; Monsters.clp - Represents the monsters in the world 
;
; Written by Joshua Scoggins
;------------------------------------------------------------------------------
(defglobal MAIN 
           ?*activate-nearby-monsters-flags* = (create$ pass-one-zone-border
                                                        passed-zone-border
                                                        activate-invisible-monsters
                                                        activate-deaf-monsters
                                                        pass-solid-lines
                                                        use-activation-biases
                                                        activation-cannot-be-avoided)
           ?*activation-biases* = (create$ activate-on-player
                                           activate-on-nearest-hostile
                                           activate-on-goal
                                           activate-randomly)
           ?*maximum-monsters-per-map* = 220
           ?*monster-types* = (create$ marine
                                       tick-energy
                                       tick-oxygen
                                       tick-kamakazi
                                       compiler-minor
                                       compiler-major
                                       compiler-minor-invisible
                                       compiler-major-invisible
                                       fighter-minor
                                       fighter-major
                                       fighter-minor-projectile
                                       fighter-major-projectile
                                       civilian-crew
                                       civilian-science
                                       civilian-security
                                       civilian-assimilated
                                       hummer-minor
                                       hummer-major
                                       hummer-big-minor
                                       hummer-big-major
                                       hummer-possessed
                                       cyborg-minor
                                       cyborg-major
                                       cyborg-flame-minor
                                       cyborg-flame-major
                                       enforcer-minor
                                       enforcer-major
                                       trooper-minor
                                       trooper-major
                                       mother-of-all-cyborgs
                                       mother-of-all-hunters
                                       sewage-yeti
                                       water-yeti
                                       lava-yeti
                                       defender-minor
                                       defender-major
                                       juggernaut-minor
                                       juggernaut-major
                                       tiny-fighter
                                       tiny-bob
                                       tiny-yeti
                                       vacuum-civilian-crew
                                       vacuum-civilian-science
                                       vacuum-civilian-security
                                       vacuum-civilian-assimilated)
           ?*monster-actions* = (create$ stationary
                                         waiting-to-attack-again
                                         moving
                                         attacking-close
                                         attacking-far
                                         being-hit
                                         dying-hard
                                         dying-soft
                                         dying-flaming
                                         teleporting
                                         teleporting-in
                                         teleporting-out)
           ?*monster-modes* = (create$ locked 
                                       losing-lock
                                       lost-lock
                                       unlocked
                                       running)
           ?*monster-flags* = (create$ promoted
                                       demoted
                                       never-been-activated
                                       blind
                                       deaf
                                       teleports-out-when-deactivated)
           )

(defclass MAIN::monster-data 
  (is-a Object has-flags)
  (slot monster-type 
        (type SYMBOL)
        (default ?NONE))
  (slot vitality 
        (type INTEGER))
  (multislot flags 
             (type SYMBOL)
             (allowed-symbols none 
                              slot-used 
                              need-path
                              recovering-from-hit
                              active
                              idle
                              berserk
                              target-damage
                              never-activated
                              demoted
                              promoted))
  (slot path)
  (slot path-segment 
        (type INSTANCE)
        (allowed-classes world-distance))
  (slot path-segment-length
        (type INSTANCE)
        (allowed-classes world-distance))
  (slot mode)
  (slot action)
  (slot target-index
        (type INTEGER))
  (slot external-velocity
        (type INSTANCE)
        (allowed-classes world-distance))
  (slot ticks-since-attack
        (type INTEGER))
  (slot attack-repetitions
        (type INTEGER))
  (slot changes-until-lock-lost
        (type INTEGER))
  (slot elevation
        (type INSTANCE)
        (allowed-classes world-distance))
  (slot object-index
        (type INTEGER))
  (slot ticks-since-last-activation
        (type INTEGER))
  (slot activation-bias)
  (slot goal-polygon-index
        (type INTEGER))
  (slot sound-location
        (type INSTANCE)
        (allowed-classes world-point3d))
  (slot sound-polygon-index
        (type INTEGER))
  (slot random-desired-height
        (type INTEGER)))

(defrule MAIN::initialize-monsters
 ;TODO: Activation logic
 =>
 (modify-instance [dynamic-world] 
  (civilians-killed-by-players 0)
  (last-monster-index-to-get-time -1)
  (last-monster-index-to-build-path -1)
  (new-monster-mangler-cookie (random))
  (new-monster-vanishing-cookie (random))))
         
;TODO: Convert initialize_monsters_for_new_level
