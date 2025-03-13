# Readme

CyberpOOnk is a data model for a cyberpunk ttrpg I'm working on in my free time. It's also a way for me to brush up on OO programming principles, hence the name.

## Design Principles

I wanted the following things when I designed this game:

1. A partial success mechanic, ala Apocalypse World and Blades in the Dark
2. No levels or classes
3. Deadly combat with traumatic hits, ala Cities Without Number
4. Lots of weapons and items to choose from, ala Cyberpunk 2020
5. A robust lifepath system, ala Cyberpunk 2022 and The Burning Wheel
6. Easy to make new characters - should take less than 10 minutes
7. Easy to play for someone with TTRPG experience

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

DLs for attacks are determined by range:

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

To hack, you must have a Cyberdeck. Each cyderdeck is customized by its owner, and no two are usable by the same operator. Hacking consists of making a Tech + Hacking check and combining a Noun and a Verb that are loaded into your Cyberdeck.

### Nouns

Barrier, Camera, Cyberware, Door, Drone, File, Machine, Program, Sensor, Transmission, Weapon

### Verbs

Activate, Analyze, Append, Blind, Deactivate, Decrypt, Defend, Delude, Erase, Find, Ghost, Glitch, Hijack, Kill, Lock, Paralyze, Replace, Sabotage, Sense, Siege, Silence, Stun, Terminate, Unlock
