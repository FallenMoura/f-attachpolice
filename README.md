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
    }
