CREATE TABLE IF NOT EXISTS `Pizza` (
	`pizzaID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomePizza` varchar(100) NOT NULL UNIQUE,
	`descricao` text NOT NULL,
	`nomeCategoria` varchar(100) NOT NULL,
	PRIMARY KEY (`pizzaID`)
);

CREATE TABLE IF NOT EXISTS `Categoria` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeCategoria` varchar(100) NOT NULL UNIQUE,
	`preco` float NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Pedido` (
	`numero` int AUTO_INCREMENT NOT NULL UNIQUE,
	`clienteID` int NOT NULL UNIQUE,
	`dataPedido` datetime NOT NULL,
	`tipoPedido` varchar(100) NOT NULL UNIQUE,
	`itemsPedido` int NOT NULL,
	PRIMARY KEY (`numero`)
);

CREATE TABLE IF NOT EXISTS `Cliente` (
	`clienteID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeCompleto` varchar(100) NOT NULL UNIQUE,
	`nome` varchar(100),
	`sobrenome` varchar(100),
	`endereco` varchar(100) NOT NULL,
	`tipoCliente` varchar(100) NOT NULL,
	PRIMARY KEY (`clienteID`)
);

CREATE TABLE IF NOT EXISTS `Items` (
	`itemsID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`items` int NOT NULL,
	`nomePizza` varchar(255) NOT NULL,
	`quantidadePizza` int NOT NULL,
	PRIMARY KEY (`itemsID`)
);

ALTER TABLE `Pizza` ADD CONSTRAINT `Pizza_fk3` FOREIGN KEY (`nomeCategoria`) REFERENCES `Categoria`(`nomeCategoria`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`clienteID`) REFERENCES `Cliente`(`clienteID`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk4` FOREIGN KEY (`itemsPedido`) REFERENCES `Items`(`items`);

ALTER TABLE `Items` ADD CONSTRAINT `Items_fk2` FOREIGN KEY (`nomePizza`) REFERENCES `Pizza`(`nomePizza`);