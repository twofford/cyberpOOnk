# Readme

CyberpOOnk is a data model for a cyberpunk ttrpg I'm working on in my free time. It's also a way for me to brush up on OO programming principles, hence the name.

## Design Principles

I wanted the following things when I designed this game:

1. A partial success mechanic, ala Apocalypse World and Blades in the Dark
2. A D20 for most rolls
3. No levels or classes
4. Deadly combat with traumatic hits, ala Cities Without Number
5. Lots of weapons and items to choose from, ala Cyberpunk 2020
6. A robust lifepath system, ala Cyberpunk 2020 and The Burning Wheel
7. Easy to make new characters - it should take less than 10 minutes
8. Clocks (I'm calling them Countdowns) ala Apocalypse World and Blades in the Dark
9. Heat, ala Cities Without Number
10. Minimal veribage - most ttrpg books are way too long!

## Stats

Brawn, Charm, Intelligence, Reflexes, Tech, Luck, Humanity

## Skills

Athleticism, Awareness, Connections, Deception, Driving, Engineering, Explosives, Hacking, Influence, Intimidation, Investigation, Marksmanship, Martial Arts, Medicine, Melee Combat, Piloting, Seduction, Stealth, Street Smarts, Tracking

## Checks

To make a check, the GM determines the Difficulty Level (DL): Easy, Medium, Hard, Very Hard or Nigh Impossible. Roll D20 + relevant stat (if any) + relevant skill (if any) + relevant modifiers (if any). Get the result from the following table.

<table>
<tbody>
<tr>
<td colspan="2"></td>
<td colspan="3">Degree of Success</td>
</tr>
<tr>
<td rowspan="6">Difficulty</td>
<td></td>
<td>Failure</td>
<td>Partial Success</td>
<td>Full Success</td>
</tr>
<tr>
<td style='text-align:right; vertical-align:middle'>Easy</td>
<td>&le; 5</td>
<td>6-15</td>
<td>&ge; 16</td>
</tr>
<tr>
<td style='text-align:right; vertical-align:middle'>Medium</td>
<td>&le; 10</td>
<td>11-20</td>
<td>&ge; 21</td>
</tr>
<tr>
<td style='text-align:right; vertical-align:middle'>Hard</td>
<td>&le; 15</td>
<td>16-25</td>
<td>&ge; 26</td>
</tr>
<tr>
<td style='text-align:right; vertical-align:middle'>Very Hard</td>
<td>&le; 20</td>
<td>21-30</td>
<td>&ge; 31</td>
</tr>
<tr>
<td style='text-align:right; vertical-align:middle'>Nigh Impossible</td>
<td>&le; 25</td>
<td>26-35</td>
<td>&ge; 36</td>
</tr>
</tbody>
</table>

A Full Success means the PC gets exactly what they wanted. A Partial Success means the PC gets what they wanted but there's a catch or a complication arises or they use up resources or a large Countdown is created or decreases. A Failure means the PC doesn't get what they want or they do get what they want but there's a major catch or a major complication arises or they use up a lot of resources or a small Countdown is created or decreases by a lot.

## Countdowns

A Countdown is a way to track when something bad is going to happen and put pressure on the PCs. When a PC fails or partially succeeds on a Check, you can create a Countdown. When you Create a Countdown, decide what will happen with the Countdown reaches zero. A partial success should create a large Countdown (size 4), while a failure should create a small countdown (size 2). Each time the PC (or another PC!) partially succeeds or fails a related Check, you can decrement the Countdown. A partial success should decrement the Countdown by 1. A failure should decrement the Countdown by 2.

Example: A PC is trying to hack into a megacorp datafortress and erase identifying info about an ally. They make a Hacking Check to sneak their way in with Unlock Barrier. The Check results in a partial success: they're in, but the GM creates a size 4 Countdown and declares that when the Countdown reaches 0, megacorp security will zero in on the PC's realspace location. The PC then makes another Hacking Check to locate the data they're after with Find File. The Check results in a Failure. The GM rules the PC finds the info, but decrements the Countdown by 2, leaving it at 2. Megacorp security is getting close to locating the PC's body in realspace. Finally, the PC tries to erase the info with a Hacking Check using Erase File. They roll a partial success. The PC erases the file, adn the GM decrements the clock by 1, leaving it at 1. The PC logs out, megacorp security none the wiser about their location. However, what if the PC had failed the last Check? In that case, the GM has a choice: either the PC can succesfully erase the file and the GM decrements the Countdown by 2, reducing it to 0 and sending megacorp security after the PC, or the PC can fail to erase the file. The first is more fun, though, and a good GM will pick that.

## Combat

Combat is divided into rounds. Each combatant takes one turn per round. Initiative is D20 + Reflexes + relevant modifiers. Each combatant gets 3 Action Points per turn. AP can be used to do the following:

- Attack (2 AP)
- Move
- Aim
- Use an item
- Hack (2 AP)
- Change weapons
- Reload (AP dependant on weapon's reload speed)
- Fix misfire (AP dependant on misfire severity)

DLs for attacks are determined by range to the target:

<table>
<tbody>
<tr>
<td>Difficulty Level</td>
<td>Range to Target in Feet</td>
</tr>
<tr>
<td>Easy</td>
<td>0-15</td>
</tr>
<tr>
<td>Medium</td>
<td>16-45</td>
</tr>
<tr>
<td>Hard</td>
<td>
<p>46-75</p>
</td>
</tr>
<tr>
<td>Very Hard</td>
<td>
<p>76-150</p>
</td>
</tr>
<tr>
<td>Nigh Impossible</td>
<td>
<p>151-300</p>
</td>
</tr>
</tbody>
</table>

## Hacking

To hack, you must have a Cyberdeck. Each cyderdeck is customized by its owner. No two are usable by the same operator. Hacking consists of making a Tech + Hacking check and combining a Noun and a Verb that are loaded into your Cyberdeck. The Noun represents the thing to be hacked. The verb represents the action to be performed.

### Nouns

Barrier, Camera, Cyberware, Door, Drone, File, Machine, Program, Sensor, Transmission, Weapon

### Verbs

Activate, Analyze, Append, Blind, Deactivate, Decrypt, Defend, Delude, Erase, Find, Ghost, Glitch, Hijack, Kill, Lock, Paralyze, Replace, Sabotage, Sense, Siege, Silence, Stun, Terminate, Unlock

## TODOS

1. Design Heat system
2. Implement Luck stat
3. Design Humanity system
4. Create Lifepaths/Character Generation
5. Create Feats
6. Design Cover system
7. Create armor, weapons, items, cyberdecks, mods
8. Update combat flowchart
9. Design Lifestyle Expenses system
