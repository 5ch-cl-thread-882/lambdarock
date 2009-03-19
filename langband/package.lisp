;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: cl-user -*-

#|

DESC: package.lisp - package def for langband
Copyright (c) 2001-2004, 2009 - Stig Erik Sandoe

|#

(in-package :cl-user)


(defpackage :org.langband.ffi
  (:use :common-lisp #+clisp :ffi #+sbcl :sb-alien)
  (:nicknames :lb-ffi :langband-ffi))


(defpackage :org.langband.engine
  (:nicknames :lb :langband-engine :lb-engine :engine :langband)
  (:use :common-lisp)
  (:export 
	   ;; dynamic variables
	   #:*angband-keys*
	   #:*cur-win*
	   #:*current-key-table*
	   #:*currently-showing-inv*
	   #:*ddd*
	   #:*ddx*
	   #:*ddy*
	   #:*ddx-ddd*
	   #:*ddy-ddd*
	   #:*dungeon*
	   #:*engine-config-dir*
	   #:*engine-data-dir*
	   #:*engine-source-dir*
	   #:*engine-num-version*
	   #:*engine-version*
	   #:*hitpoint-warning*
	   #:*level*
	   #:*map-frame*
	   #:*player*
	   ;;#:*redraw*
	   #:*roguelike-keys*
	   #:*saveblock*
	   #:*saveheader*
	   #:*strategy*
	   ;;#:*update*
	   #:*variant*
	   #:*windows*
	   #:*winformat-padchar*
	   #:*winformat-forced-numbersign*

	   ;; classes/structs types
	   #:activatable
	   #:active-door
	   #:active-monster
	   #:active-object
	   #:active-room
	   #:active-trap
	   #:add-to-inventory
	   #:ai-strategy
	   #:alloc-entry
	   #:animation
	   #:armour-rating
	   #:attack
	   #:attack-type
	   
	   #:character-class
	   #:character-race
	   #:character-stat
	   #:creature-attribute
	   
	   #:decor
	   #:door-type
	   #:dungeon
	   #:dungeon-coord

	   #:effect
	   #:effect-entry
	   #:element

	   #:flavour
	   #:flavour-type
	   #:floor-type

	   #:game-obj-table
	   #:gender
	   #:get-new-object

	   #:has-gold>=
	   #:has-object?
	   #:help-topic
	   #:house
	   #:hs-entry

	   #:illegal-char-class-data
	   #:illegal-char-race-data
	   #:illegal-data-definition
	   #:illegal-monster-data
	   #:illegal-object-data
	   #:illegal-room-data
	   #:input-event
	   #:item-table
	   #:items-in-container
	   #:items-in-house
	   #:items-in-store
	   #:items-on-floor
	   #:items-worn

	   #:keyboard-event
	   
	   #:l-binary-stream
	   #:l-event
	   #:l-readable-stream
	   #:langband-quit
	   #:level

	   #:message
	   #:misc-player-info
	   #:missile-movement
	   #:monster-kind
	   #:monster-knowledge
	   #:mouse-event

	   #:object-kind
	   #:object-knowledge
	   #:old-player-info
	   #:owner

	   #:peaceful-mover ;; possibly move
	   #:player
	   #:player-abilities
	   #:primitive-melee-attacker
	   
	   #:random-level
	   #:remove-from-inventory
	   #:room-type

	   #:saveblock
	   #:savefile-problem
	   #:saveheader
	   #:sprite-movement
	   #:stat-field ;; maybe remove later
	   #:store
	   #:store-owner

	   #:target
	   #:temp-creature-attribute
	   #:themed-level
	   #:thrown-object-movement
	   #:trap-type
	   #:treasure-drop
	   
	   #:u-fixnum
	   #:ui-theme
	   #:unique-monster

	   #:variant
	   #:visual-event
	   #:visual-projectile

	   #:walking-movement
	   #:window
	   #:worn-item-slot

	   
	   ;;; methods and functions

	   #:a2i
	   #:activate-object
	   #:activated?
	   #:add-creature-attribute
	   #:add-magic-to-item!
	   #:add-monster-knowledge-flag!
	   #:alloc-locations
	   #:alloc.depth
	   #:alloc.obj
	   #:alloc.prob2
	   #:alloc.prob3
	   #:allocate-monster!
	   #:amon.kind
	   #:amon.seen-by-player?
	   #:amon.strategies
	   #:amon.temp-attrs
	   #:amon.vis-flag
	   #:any-redraws?
	   #:any-updates?
	   #:aobj.contains
	   #:aobj.identify
	   #:aobj.inscr
	   #:aobj.kind
	   #:aobj.marked
	   #:aobj.number
	   #:aobj.speed-modifier
	   #:appears-in-group?
	   #:apply-effect-to-area
	   #:apply-filters-on-obj
	   #:apply-magic!
	   #:apply-projection-effect-to-target!
	   #:apply-usual-effects-on-used-object!
	   #:arrange-game-exit&
	   #:ask-for-redraw!
	   #:ask-for-update!
	   #:attack-effect
	   #:attempt-multi-creation!
	   #:attr.default-value
	   #:attr.duration
	   #:attr.key
	   #:attr.on-update
	   #:attr.turned-off-msg
	   #:attr.turned-on-msg
	   #:attr.update-fun
	   #:attr.value

	   #:basic-frame-shown?
	   #:bit-flag-add!
	   #:bit-flag-and
	   #:bit-flag-remove!
	   #:bit-flag-set?
	   #:build-house!
	   #:buttonify-selectable-ui-object
	   #:buttonify-text

	   #:calculate-abilities!
	   #:calculate-creature-bonuses!
	   #:calculate-creature-hit-points!
	   #:calculate-creature-light-radius!
	   #:calculate-score
	   #:can-creature-drop?
	   #:can-place?
	   #:can-melee-attack?
	   #:carries-object?
	   #:cave-coord
	   #:cave-decor
	   #:cave-empty-bold?
	   #:cave-flags
	   #:cave-floor
	   #:cave-floor-bold?
	   #:cave-icky?
	   #:cave-monsters
	   #:cave-objects
	   #:centre-string
	   #:check-keypress
	   #:class.abilities
	   #:class.name
	   #:class.skills
	   #:class.stat-sustains
	   #:class.symbol
	   #:clear-coord
	   #:clear-row
	   #:clear-window
	   #:clear-window-from
	   #:colour-area
	   #:colour-window
	   #:convert-obj
	   #:coord-floor
	   #:coord.decor
	   #:coord.flags
	   #:coord.floor
	   #:coord.monsters
	   #:coord.objects
	   #:copy-active-object
	   #:copy-hash-table
	   #:create-alloc-table-monsters
	   #:create-alloc-table-objects
	   #:create-aobj-from-id
	   #:create-aobj-from-kind
	   #:create-aobj-from-spec
	   #:create-appropriate-level
	   #:create-basic-allocation-table
	   #:create-dungeon
	   #:create-gold
	   #:creature-alive?
	   #:current-hp
	   #:current-mana
	   #:curse-object!

	   #:decor-operation
	   #:decor.visible?
	   #:deduct-hp!
	   #:define-attack-description
	   #:define-basic-flavour
	   #:define-character-class
	   #:define-character-race
	   #:define-character-stat
	   #:define-door-type
	   #:define-effect
	   #:define-element
	   #:define-flavour-type
	   #:define-floor-type
	   #:define-house
	   #:define-key-operation
	   #:define-keypress
	   #:define-monster-attack
	   #:define-monster-kind
	   #:define-object-kind
	   #:define-object-type
	   #:define-printfield-handler
	   #:define-redraw-key
	   #:define-room
	   #:define-settings
	   #:define-sound-effect
	   #:define-store
	   #:define-store-owner
	   #:define-trap-type
	   #:define-update-key
	   #:define-visual-projectile
	   #:define-visual-state
	   #:delay
	   #:deliver-damage!
	   #:deliver-elemental-damage!
	   #:display-creature
	   #:display-help-topics
	   #:display-house
	   #:display-moving-object
	   #:display-player-combat-ratings
	   #:display-player-skills
	   #:display-target
	   #:display-visual-states
	   #:display-x
	   #:display-y
	   #:distance
	   #:distribute-flavours!
	   #:disturbance
	   #:do-projection
	   #:door.closed?
	   #:door.lock
	   #:door.stuck
	   #:drop-near-location!
	   #:dungeon.decor
	   #:dungeon.depth
	   #:dungeon.height
	   #:dungeon.monsters
	   #:dungeon.table
	   #:dungeon.width

	   #:effect.name
	   #:effect.number
	   #:effect.symbol
	   #:effect-entry-energy-use
	   #:effect-entry-fun
	   #:effect-entry-p
	   #:effect-entry-type
	   #:element.bit-flag
	   #:element.name
	   #:element.number
	   #:element.symbol
	   #:energy-for-speed
	   #:engine-allows-gfx-tiles?
	   #:equip-character!
	   #:error-condition
	   #:event.id
	   #:execute-strategy

	   #:factor.offensive
	   #:factor.defensive
	   #:factor.cost
	   #:fetch-event
	   #:filed-player-data
	   #:filed-variant-data
	   #:fill-area
	   #:fill-dungeon-part-with-floor!  ;; clash with next?
	   #:fill-dungeon-with-floor!
	   #:fill-up-store!
	   #:finalise-visual-event
	   #:find-appropriate-monster
	   #:find-appropriate-room
	   #:find-image
	   #:find-owner-for-house
	   #:flag
	   #:flavour.name
	   #:flavour-object!
	   #:flavour-simple-object-kind!
	   #:flavour-type.generator-fn
	   #:flavour-type.unused-flavours
	   #:floor.flags
	   #:floor.id
	   #:floor.name
	   #:floor.numeric-id
	   #:flush-coords
	   #:flush-messages!
	   #:flush-window
	   #:format-message!
	   #:format-note!

	   #:gain-power-level!
	   #:gender.symbol
	   #:generate-draw
	   #:generate-fill
	   #:generate-level!
	   #:generate-random-name
	   #:generate-room
	   #:get-active-monster-by-level
	   #:get-active-object-by-level
	   #:get-aim-direction
	   #:get-armour-modifier
	   #:get-armour-rating
	   #:get-array-with-numbers
	   #:get-attack-description
	   #:get-attribute-value
	   #:get-character-picture
	   #:get-class-name
	   #:get-class-tile
	   #:get-coord-trigger
	   #:get-creature-ac
	   #:get-creature-burden
	   #:get-creature-desc
	   #:get-creature-energy
	   #:get-creature-inventory
	   #:get-creature-mana
	   #:get-creature-name
	   #:get-creature-speed
	   #:get-creature-state
	   #:get-damage-dice
	   #:get-damage-modifier
	   #:get-decor-name
	   #:get-destination-coords
	   #:get-direction-from-coord-diff
	   #:get-element-flag
	   #:get-element-number
	   #:get-floor
	   #:get-floor-type
	   #:get-frame-width
	   #:get-gender
	   #:get-house
	   #:get-id
	   #:get-ignores
	   #:get-immunities
	   #:get-indent-string
	   #:get-information
	   #:get-item-table
	   #:get-key-operations
	   #:get-last-window-column
	   #:get-last-window-line
	   #:get-late-bind-function
	   #:get-level-appropriate-enchantment
	   #:get-level-builder
	   #:get-light-radius
	   #:get-loadable-form
	   #:get-melee-attack-skill
	   #:get-mkind-alloc-table
	   #:get-mkind-table
	   #:get-monster-kind
	   #:get-monster-kind-by-level
	   #:get-monster-knowledge
	   #:get-move-direction
	   #:get-mtype-table
	   #:get-named-gameobj-table
	   #:get-number-of-damage-dice
	   #:get-object-effect
	   #:get-object-kind
	   #:get-object-kind-by-level
	   #:get-object-knowledge
	   #:get-offer
	   #:get-otype-table
	   #:get-power-lvl
	   #:get-power-of-attack
	   #:get-price
	   #:get-race-name
	   #:get-ranged-attack-skill
	   #:get-resistance-table ;; returns table
	   #:get-resists ;; returns bitfield integer
	   #:get-room
	   #:get-sanctity
	   #:get-search-skill
	   #:get-setting
	   #:get-settings-obj
	   #:get-stat-modifiers
	   #:get-stat-name-from-num
	   #:get-stat-obj
	   #:get-stat-sustains
	   #:get-string-input
	   #:get-system-type
	   #:get-tactical-bid
	   #:get-target-at-coordinate
	   #:get-title-for-level
	   #:get-tohit-chance
	   #:get-tohit-modifier
	   #:get-visual-projectile
	   #:get-visual-state
	   #:get-vulnerabilities
	   #:get-window
	   #:get-xp-value
	   #:gfx-sym
	   #:gobj-table.alloc-table
	   #:gobj-table.obj-table
	   #:gobj-table.obj-table-by-lvl
	   #:graphical-map?
	   #:grid-x
	   #:grid-y

	   #:handle-mouse-click
	   #:handle-player-updates!
	   #:handle-stuff
	   #:handle-turn
	   #:has-ability?
	   #:has-frame?
	   #:has-information?
	   #:heal-creature!
	   #:house.items
	   #:hs-entry.cause-of-death
	   #:hs-entry.depth
	   #:hs-entry.gold
	   #:hs-entry.level
	   #:hs-entry.xp
	   
	   #:i2a
	   #:idx-value
	   #:idx-paint-value
	   #:immune-to-element?
	   #:in-bounds-fully?
	   #:init-visual-event
	   #:initialise-character-class!
	   #:initialise-character-race!
	   #:initialise-floors&
	   #:initialise-monster-kind!
	   #:initialise-monsters&
	   #:initialise-object-kind!
	   #:initialise-objects&
	   #:int-/
	   #:interactive-creation-of-player
	   #:interactive-destroy-item!
	   #:interactive-door-operation!
	   #:interactive-drop-item!
	   #:interactive-take-off-item!
	   #:interactive-targeting!
	   #:interactive-throw-item!
	   #:interactive-trap-operation!
	   #:interactive-use-item!
	   #:interactive-wear-item!
	   #:is-artifact?  ;; right place?
	   #:is-blind?
	   #:is-broken?
	   #:is-creatable?
	   #:is-cursed?
	   #:is-door?
	   #:is-event?
	   #:is-female?
	   #:is-frame-shown?
	   #:is-legal-effect?
	   #:is-legal-element?
	   #:is-legal-stat?
	   #:is-legal-target?
	   #:is-magical?
	   #:is-male?
	   #:is-object-known?
	   #:is-monster?
	   #:is-player?
	   #:is-resting?
	   #:is-sleeping?
	   #:is-store?
	   #:is-trap?
	   #:is-unique-monster?
	   #:is-variant?
	   #:is-vowel?
	   #:is-window?
	   #:is-worthless?
	   #:item-table-add!
	   #:item-table-clean!
	   #:item-table-find
	   #:item-table-iterate!
	   #:item-table-more-room?
	   #:item-table-print
	   #:item-table-remove!
	   #:item-table-sort!
	   #:item-table-verify-key
	   #:items.cur-size
	   #:items.objs

	   #:kill-target!

	   #:lang.stream
	   #:lang-warn
	   #:lbsys/class-name
	   #:lbsys/ensure-dir-name
	   #:lbsys/garbage-collect
	   #:lbsys/get-current-directory
	   #:lbsys/make-sure-dirs-exist&
	   #:lbsys/tricky-profile ;; don't expect this to work
	   #:learn-about-object!
	   #:level.depth
	   #:level.dungeon
	   #:level.id
	   #:level.symbol
	   #:level-ready?
	   #:light-spot!
	   #:load-binary-array
	   #:load-binary-string
	   #:load-image&
	   #:load-image-spec&
	   #:load-setting-background
	   #:load-object
	   #:load-variant&
	   #:load-variant-data&
	   #:load-variant-object
	   #:loadable-value
	   #:location-x
	   #:location-y

	   #:magic-add
	   #:make-container
	   #:make-coord-event
	   #:make-creature-attribute
	   #:make-event
	   #:make-game-obj-table
	   #:make-gender
	   #:make-help-topic
	   #:make-note-buttons
	   #:make-random-level-obj
	   #:make-selectable-ui-object
	   #:make-simple-button
	   #:make-thrown-visual
	   #:make-walk-movement
	   #:max-cap
	   #:maximum-hp
	   #:maximum-mana
	   #:melee-hit-ac?
	   #:melee-hit-creature?
	   #:melee-inflict-damage!
	   #:min-cap
	   #:missile-hit-creature?
	   #:missile-inflict-damage!
	   #:modify-attribute!
	   #:modify-creature-state!
	   #:modify-gold!
	   #:modify-satiation!
	   #:modify-visual-state!
	   #:modify-xp!
	   #:monster.abilities
	   #:monster.alignment
	   #:monster.flags
	   #:monster.gender
	   #:monster.name
	   #:monster.num-killed
	   #:monster.numeric-id
	   #:monster.power-lvl
	   #:monster.sp-abilities
	   #:monster.speed
	   #:monster.title
	   #:monster.tried-elm
	   #:monster.type
	   #:move-creature-to-depth!
	   #:move-player!

	   #:need-flavour?
	   #:non-negative-integer?
	   #:nonboolsym?

	   #:object.abilities
	   #:object.aware
	   #:object.cost
	   #:object.effects
	   #:object.events
	   #:object.flags
	   #:object.flavour
	   #:object.name
	   #:object.numeric-id
	   #:object.power-lvl
	   #:object.sort-value
	   #:object.speed-modifier
	   #:object.text-colour
	   #:object.the-kind
	   #:object.weight
	   #:object-effect
	   #:ok-object?
	   #:old.heavy-bow
	   #:old.heavy-weapon
	   #:old.icky-weapon
	   #:on-drop-object
	   #:on-move-to-coord
	   #:on-new-player
	   #:on-pickup-object
	   #:on-take-off-object
	   #:on-wear-object
	   #:output-string!

	   #:paint-coord
	   #:paint-gfx-image
	   #:paint-gfx-image&
	   #:paint-window
	   #:parse-and-roll-dice
	   #:parse-dice
	   #:pause-at-line!
	   #:pause-last-line!
	   #:pick-up-from-floor!
	   #:place-monster!
	   #:place-player!
	   #:place-single-monster!
	   #:play-music
	   #:play-sound
	   #:player-can-see-bold?
	   #:player-has-los-bold?
	   #:player-is-at?
	   #:player.actual-abilities
	   #:player.active-stats
	   #:player.calc-attrs ;; maybe not export
	   #:player.class
	   #:player.current-xp
	   #:player.dead-from
	   #:player.depth
	   #:player.energy-use
	   #:player.equipment
	   #:player.fraction-mana
	   #:player.gender
	   #:player.gold
	   #:player.infravision
	   #:player.leaving?
	   #:player.max-depth
	   #:player.max-level
	   #:player.maximum-xp
	   #:player.modbase-stats
	   #:player.monster-knowledge
	   #:player.name
	   #:player.perceived-abilities
	   #:player.power-lvl
	   #:player.race
	   #:player.satiation
	   #:player.see-invisible
	   #:player.skills
	   #:player.speed
	   #:player.target
	   #:player.temp-attrs ;; maybe not export
	   #:player.view-x
	   #:player.view-y
	   #:player.xp-table
	   #:plural-name
	   #:positive-integer?
	   #:possible-identify!
	   #:print-basic-frame
	   #:print-depth
	   #:print-extra-frame-content
	   #:print-hunger
	   #:print-map
	   #:print-message!
	   #:print-misc-info
	   #:print-note!
	   #:print-number
	   #:print-resistance-table
	   #:print-stat-value
	   #:print-text!
	   #:print-tomb
	   #:printfield-handler
	   #:process-single-monster!
	   #:process-world&
	   #:produce-active-monster
	   #:produce-active-object
	   #:produce-character-class
	   #:produce-character-race
	   #:produce-high-score-object
	   #:produce-monster-kind
	   #:produce-object-kind
	   #:produce-player-object
	   #:project-path
	   #:projectile.gfx-beam
	   #:projectile.gfx-explosion
	   #:projectile.gfx-impact
	   #:projectile.gfx-path
	   #:projectile.id
	   #:projectile.text-beam
	   #:projectile.text-explosion
	   #:projectile.text-impact
	   #:projectile.text-path
	   #:put-coloured-line!
	   #:put-coloured-str!
	   #:put-object-in-container!

	   #:query-for-character-basics!
	   #:quit-game&
	   
	   #:race.abilities
	   #:race.skills
	   #:race.stat-sustains
	   #:race.symbol
	   #:rand-elm
	   #:rand-range
	   #:rand-spread
	   #:randint
	   #:read-map
	   #:read-one-character
	   #:read-pref-file
	   #:redraw-stuff
	   #:refresh-window
	   #:regenerate-hp!
	   #:register-event&
	   #:register-field-order
	   #:register-help-topic&
	   #:register-information&
	   #:register-level!
	   #:register-level-builder!
	   #:register-slot-order&
	   #:register-variant&
	   #:remove-monster-from-dungeon!
	   #:remove-target-display
	   #:reset-player-object!
	   #:reset-redraw!
	   #:reset-update!
	   #:resists-element?
	   #:roll-dice
	   #:roll-hitpoints-for-new-level
	   #:roll-stats!
	   #:roll-up-character!
	   #:room-builder
	   #:room-constructor
	   #:room-type
	   #:room-type.builder
	   #:room-type.constructor
	   #:room-type.id
	   #:room-type.min-level
	   #:room-type.name
	   #:room-type.parent
	   #:room-type.size-mode
	   #:room-type.type
	   #:%room-has-light? ;; hack! fix!
	   #:round-/
	   #:run-along-corridor
	   #:run-in-direction

	   #:satisfies-obj-type?
	   #:save-binary-array
	   #:save-binary-string
	   #:save-object
	   #:saveheader.engine-num-version
	   #:search-area!
	   #:set-cursor-to
	   #:set-flag
	   #:select-and-return-item
	   #:select-displayed-alternative
	   #:select-item
	   #:select-item-from-store
	   #:set-cursor-visibility
	   #:setting-lookup
	   #:shoot-a-missile
	   #:show-messages
	   #:shrink-array!
	   #:shuffle-array!
	   #:signal-condition
	   #:stackable?
	   #:stat.bit-flag
	   #:stat.fields
	   #:stat.number
	   #:stat.symbol
	   #:stat-field-data
	   #:stat-field-lower
	   #:stat-field-p
	   #:stat-field-upper
	   #:stop-creature-activity
	   #:store-buys-item?
	   #:store-empty?
	   #:store-generate-object
	   #:store-maintenance!
	   #:store-mass-produce!
	   #:store.will-buy
	   #:strategy.destinations
	   #:strategy.id
	   #:swap-monsters!
	   #:switch-inventory-view
	   #:switch-map-mode
	   #:symbolify

	   #:text-paint-value
	   #:text-sym
	   #:text-to-ascii
	   #:texture-background!
	   #:throw-object
	   #:tile-file
	   #:tile-number
	   #:tile-paint-value
	   #:trap-effect
	   #:trigger-printfield
	   #:trigger-printfield-hooks&
	   #:trigger-special-ability
	   #:trigger-visual-event

	   #:uncurse-object!
	   #:unless-bind
	   #:unset-flag
	   #:update-inventory-row
	   #:update-monster!
	   #:update-player-stat! ;; rename later?
	   #:update-stuff
	   #:update-xp-table!
	   #:use-images?
	   #:use-object!
	   #:use-stair!

	   #:variant-data-fname
	   #:variant-home-path
	   #:variant-save-directory
	   #:variant.classes
	   #:variant.day-length
	   #:variant.effects
	   #:variant.elements
	   #:variant.filters
	   #:variant.flavour-types
	   #:variant.floor-types
	   #:variant.genders
	   #:variant.images
	   #:variant.max-charlevel
	   #:variant.monsters-by-level
	   #:variant.objects
	   #:variant.objects-by-level
	   #:variant.quests
	   #:variant.races
	   #:variant.stat-length
	   #:variant.stats
	   #:variant.turn
	   #:variant.visual-effects
	   #:verify-check
	   #:verify-id
	   #:viewport-contains?
	   #:visit-house
	   #:visual-state.desc
	   #:vulnerable-to-element?

	   #:want-redraw?
	   #:want-update?
	   #:warn-on-failure
	   #:when-bind
	   #:while
	   #:win/format
	   #:window-allows-gfx-tiles?
	   #:window-coord
	   #:window.backgroundfile
	   #:window.disabled?
	   #:window.height
	   #:window.num-id
	   #:window.pixel-height
	   #:window.pixel-width
	   #:window.repaint?
	   #:window.tile-height
	   #:window.tile-width
	   #:window.visible?
	   #:window.width
	   #:with-dialogue
	   #:with-dungeon
	   #:with-frame
	   #:with-full-frame
	   #:write-obj-description
	   #:write-pluralised-string

	   #:x-offset

	   #:y-offset
	   
	   ;; exported symbols
	   #:depth
	   #:energy
	   #:engine-gfx
	   #:events
	   #:eq.backpack
	   #:gcu
	   #:id
	   #:ignores
	   #:immunities
	   #:loc-x
	   #:loc-y
	   #:locations
	   #:max-charlevel
	   #:monsters-by-level
	   #:name
	   #:numeric-id
	   #:obj
	   #:objects-by-level
	   #:picture
	   #:power-lvl
	   #:quests
	   #:resists
	   #:sdl
	   #:shift
	   #:sort-value
	   #:symbol
	   #:temp-attributes
	   #:text-colour
	   #:variant-gfx
	   #:vulnerabilities
	   #:x11
	   #:xp-table

	   ;; these are game-constants with special meaning
	   #:<absorbs-symbol>
	   #:<aggravates> ;; should not be there
	   #:<blind>
	   #:<breeder>
	   #:<cold-blood>
	   #:<colour-changing>
	   #:<confusion>
	   #:<curse>
	   #:<cut>
	   #:<drop>
	   #:<drop-chance>
	   #:<drop-good>
	   #:<drop-great>
	   #:<drop-planned>
	   #:<easy-know>
	   #:<female>
	   #:<heavy>
	   #:<increase>
	   #:<initial-sleeper>
	   #:<invisible>
	   #:<light>
	   #:<male>
	   #:<max-hitpoints>
	   #:<money>
	   #:<never-attack>
	   #:<never-move>
	   #:<nothing>
	   #:<only-drop-gold>
	   #:<only-drop-items>
	   #:<paralysed>
	   #:<permanent>
	   #:<random-mover>
	   #:<reduce>
	   #:<resist>
	   #:<restore>
	   #:<see-through>
	   #:<sleeping>
	   #:<unique>

	   ;; printfield names
	   #:-basic/race-
	   #:-basic/class-
	   #:-basic/level-
	   #:-basic/xp-
	   #:-basic/gold-
	   #:-basic/stats-
	   #:-basic/armour-
	   #:-basic/hitpoints-
	   #:-basic/speed-
	   #:-basic/hunger-
	   #:-tiled/stats-
	   #:-tiled/level-
	   #:-tiled/armour-
	   #:-tiled/hitpoints-
	   
	   #:*visevents*
	   #:visual-event
	   #:make-visual-event
	   #:visevent.id
	   #:visevent.flags
	   #:visevent.mode
	   #:visevent.window
	   #:visevent.current-x
	   #:visevent.current-y
	   #:visevent.blocking?
	   #:visevent.data
	   #:visevent.object
	   #:visevent.animation
	   #:visevent.move-speed
	   #:visevent.last-x
	   #:visevent.last-y
	   #:visevent.last-move-x
	   #:visevent.last-move-y
	   #:visevent.source-x
	   #:visevent.source-y
	   #:visevent.target-x
	   #:visevent.target-y
	   #:visevent.angle
	   #:visevent.shooter
	   #:visevent.missile-weapon
	   )
  #+lisp2csf
  (:documentation "This is the Langband game package."))


(defpackage :org.langband.datastructures
  (:nicknames :lb-ds)
  (:use :common-lisp)
  (:export #:pq.get
	   #:pq.put
	   #:pq.top
	   #:pq.count
	   #:make-pq

	   #:make-queue
	   #:queue-as-list
	   #:enqueue
	   #:dequeue
	   ))

