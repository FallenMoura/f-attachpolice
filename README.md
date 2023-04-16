# f-attachpolice
- Script simples para complementar o roleplay de polícia [QBCORE]
- Novo QBCore

## Features
- Police Shop
- Compra do item do porte de arma
- Ped com várias opções de Dispatch
- CallSign em cima do carro
- Totalmente Configuravel

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)
- [um-idcard](https://github.com/alp1x/um-idcard)

## Installation

- Step 1: Drag and drop resources onto your server!
- Step 1-2: You don't need to import sql in your database script is doing it itself.
- Step 2: Configure the script in the framework of your choice.
- Step 3: Add items to the list

- QBCore (shared/items.lua)
```lua
    ['police_lockpick'] 					 = {['name'] = 'police_lockpick', 			 	  	  	['label'] = 'Lockpick da Polícia', 				['weight'] = 300, 		['type'] = 'item', 		['image'] = 'lockpick.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Very useful if you lose your keys a lot.. or if you want to use it for something else...'},
```
-Step 4: Replace Config.Peds

-qb-target (int.lua)
```lua
Config.Peds = {
		[1] = {
  model = 's_f_y_cop_01',
  coords = vector4(459.03, -1017.21, 27.16, 92.48),
  minusOne = true,
  freeze = true,
  invincible = true,
  blockevents = true,
  target = {
    useModel = false,
    options = {
      {
       num = 1,
        type = "client",
        event = "f-attachpolice:client:menu",
        icon = 'fa-solid fa-car',
        label = 'Comprar carro',
        job = 'police',
      },
    },
    distance = 2.5,
  },
},
	[2] = {
  model = 's_m_y_cop_01',
  coords = vector4(442.73, -981.92, 30.69, 93.61),
  minusOne = true,
  freeze = true,
  invincible = true,
  blockevents = true,
  target = {
    useModel = false,
    options = {
      {
       num = 1,
        type = "client",
        event = "qb-policeweapon:client:pedirlicenca",
        icon = 'fa-solid fa-car',
        label = 'Pedir Licença',
        job = 'police',
      },
	  {
       num = 2,
        type = "client",
        event = "qb-policeweapon:client:denuncia",
        icon = 'fa-solid fa-car',
        label = 'Apresentar uma denuncia',
        job = 'police',
      },
	  {
       num = 3,
        type = "client",
        event = "qb-policeweapon:client:chamaragente",
        icon = 'fa-solid fa-car',
        label = 'Chamar um agente',
        job = 'police',
      },
	  {
       num = 4,
        type = "client",
        event = "qb-policeweapon:client:buylicenseweapon",
        icon = 'fa-solid fa-gun',
        label = 'Comprar Porte de arma',
      }
    },
    distance = 2.5,
  },
},
}
```
