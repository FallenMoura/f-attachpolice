Config = {}

Config.QBTargetName = 'qb-target'
Config.QBMenuName = 'qb-menu'
Config.QBInputName = 'qb-input'


-- **Peds** --
Config.ShopPed = {
    ["Ped1"] = {
        ["SpotName"] = "PD Car Shop",
        ["LabelSpotName"] = "Comprar Carro",
        ["PedCoords"] = vector3(459.56, -973.54, 24.7),
        ["PedHeading"] = 182.89,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "s_f_y_cop_01",
        ["PedModelHash"] = 0x15F8700D,

    },
}

Config.MRPDped = {
    ["Ped1"] = {
        ["SpotName"] = "MRPD Ped",
        ["LabelSpotName"] = "Pedir Licença",
        ["LabelSpotName2"] = "Apresentar uma denuncia",
        ["LabelSpotName3"] = "Chamar um agente",
        ["LabelSpotName4"] = "Comprar Porte de arma",
        ["PedCoords"] = vector3(442.76, -981.77, 29.69),
        ["PedHeading"] = 88.2,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "s_f_y_cop_01",
        ["PedModelHash"] = 0x0703F106,

    },
}


-- **Ped de Mission Row** --

Config.CustoLicenca = 200 -- Quanto o porte de arma custa
Config.Pagamento = 'bank' -- Pode ser bank, cash, crypto
Config.item = 'weaponlicense' -- Qual é o item do cartão do porte de arma

-- Notify

Config.SemLicenca = "Não tens permissão para efetuar o registo de porte de arma" -- Notificação para quando não tens a licença dada pelo mdt ou pelo comando /grantlicense
Config.ComparencaAgente = "Peça a compareça de um agente. Pode pedi-lo na receção do Departamento" -- Notificação para informar como pode tirar o Porte de Arma
Config.Comprada = "Ja recompras-te o Porte de arma!! JUIZO!..." -- Notificação para quando compras o porte de arma
Config.SemDinheiro = "Não tens dinheiro para a compra da licença" -- Notificação para quando nao tens dinheiro para comprar o Porte de Arma
Config.TempoNotify = 5000 --São 5 segundos    1seg = 1000ms | Tempo em que todas as notificações acima duram


-- Dispatch
Config.PedirLicenca = "Pedido de licença" -- Nome do blip do dispatch no mapa
Config.LicencaCodigo = "10-33" -- Codigo que aparece antes do nome do blip do dispatch no mapa
Config.LicencaPriority = 3 -- Prioridade (1-3), Varia a cor do codigo do dispatch e o som que ele emite

Config.Denuncia = "Efetuar uma denuncia" -- Nome do blip do dispatch no mapa
Config.DenunciaCodigo = "10-33" -- Codigo que aparece antes do nome do blip do dispatch no mapa
Config.DenunciaPriority = 3 -- Prioridade (1-3), Varia a cor do codigo do dispatch e o som que ele emite

Config.ChamarAgente = "Compareça de um agente" -- Nome do blip do dispatch no mapa
Config.ChamarAgenteCodigo = "10-33" -- Codigo que aparece antes do nome do blip do dispatch no mapa
Config.ChamarAgentePriority = 3 -- Prioridade (1-3), Varia a cor do codigo do dispatch e o som que ele emite


-- **Police Shop** --

Config.LetrasMatricula = 'DPLS' -- Letras da matricula, depois aparecem uma sequência aleatória de 4 números
Config.SpawnCarro = vector4(449.13, -1020.09, 28.47, 83.22) -- Local onde o carro dá spawn
Config.PoliceCar = {
    ['pd1'] = {label = 'Ford Crownvic', price = 200}, -- Primeiro argumento ('police') é o codigo do spawn do carro, o segundo e o nome em que vai aparecer no menu e o terceiro e o valor do carro
    ['char'] = {label = 'Dodge Charger', price = 200},
    ['poldemonrb'] = {label = 'Dodge Demon', price = 200},
    ['Explorer'] = {label = 'Ford Explorer', price = 200},
    ['mach1rb'] = {label = 'Ford Mustang', price = 200},
    ['zr1RB'] = {label = 'Corvette', price = 200},
    ['sodurango'] = {label = 'Dodge Durango', price = 200},
    ['sotruck'] = {label = 'Ford F-150', price = 200},
    ['sotaurus'] = {label = 'Ford Taurus', price = 200},
}
Config.ShopPagamento = 'bank' -- Pode ser bank, cash, crypto
Config.ShopSemDinheiro = "Não tens dinheiro para comprares este veículo" -- Notificação para quando nao tens dinheiro para comprar o carro
Config.ShopTempoNotify = 5000 --São 5 segundos    1seg = 1000ms | Tempo que esta notificação dura

-- **Impound** --

Config.Label = "Impound Request"