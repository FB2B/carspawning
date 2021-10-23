# Vehicle Spawn Menu

This is a simple resource I made utilising the amazing discord API resource created by Badger, Badger_Discord_API, to assign permissions to players based on their discord roles, and then use these permissions via a vehicle spawn menu ui.
I hope you enjoy this resource, please show some love to Badger, his github can be found here: https://github.com/JaredScar

 -- Please read all the documentation below --

### Installation

• Install and configure Badger_Discord_API according to his documentaion, found here: https://docs.badger.store/fivem-discord-scripts/badger_discord_api/

• Place the `carspawning` folder into your `resources` directory

• Append `start carspawning` to your server.cfg

• Configure `index.html` and `server.lua` to your requirements. [Read below for more information]

### Configuring the resource

#### Adding categories to the menu:

• Navigate to `ui/index.html` and find line `21` - This is the start of the list of categories

• Feel free to edit the `value` attribute and the inner text to whatever you want. But be sure to make a mental note of the `value` attribute, as you will need this when assigning a vehicle page to this category

• To add more categories (you may add any number of categories you wish), simply append `<div class="catagory" value="[value]">[Name]</div>` anywhere within the div `list`, make sure you change `[value]` to the value of the catagory, and `[name]` to the name you wish to be displayed

• To create a vehicle page for this category, navigate to line `33` of `ui/index.html`, and append the following code:
```
<div id="[value]">
  <h1>[Name]</h1>
  <!-- Add cards below this line -->
  
<div>
```
Make sure you change `[value]` to the value you assigned when making your catagory, and feel free to set `[Name]` to be whatever you wish.

#### Adding Vehicles to a catagory

• Navigate to the vehicle page `div` of the catagory you wish to add the vehicle to, e.g. line `38` for the `addons` catagory.

• Append the following code to this `div`, ensuring it is below the heading you assigned. (An example will be provided below)
```
<div class="card" power=[power]>
  <b>[Vehicle Name]</b>
  <p>[Spawncode]</p>
  <button name="spawn" modelname="[spawncode]">Spawn</button>
</div>
```
Make sure you set `[power]` to be the power level of the card you wish to set (Power values will be covered below), set `[Vehicle Name]` to the name of the vehicle (e.g. "Dodge Charger"), set `[spawncode]` to be the spawncode of the car. This should be done within the `p` tags, and within the `modelname` attribute of the spawn button.

#### Power Levels [permissions]

A "power level" is the permission of a card. For example, if a card's power level is set at 10, the player must have a permission level of 10 to be able to see this card.

To assign a power level to a card, when adding a vehicle card set the `power` attribute of the card, to be the value of the permission you want the player to require.

##### Assigning Power levels to discord roles:

• Navigate to the `server.lua` file

• On the first line of the `server.lua` file is the start of the permissions array, this is where we will tell the resource, what discord roles, grant players what permissions

• To add a permission to a role, add (or edit the existing lines) `{[discord_role_id], [perm_level]},` Making sure to set `[discord_role_id]` to the ID of the discord role you wish to have the permission, and `[perm_level]` to the permission level you want the role to have.

## FAQ

#### Q - The menu isn't working / I can't close the menu / I can't press anything

A - Most likely cause of this is that you have renamed the resource, the resource MUST be named `carspawning` for it to work


#### Q - Your example shows cards with coloured borders, how do I do this?
A - Be default I have added a few additional card style, these are; `new`, `special`, and `admin`. To assign them, when making your card set the card `class` attribute to be any of the following; `"card"` - default | `"card card-new"` - New | `"card card-special"` - Special | `"card card-admin"` - Admin

#### Q - Can I make new card style?
A - Yes, it is possible to make new card styles however, I will not cover how to do so in this documentation, and some css knowledge is required.
