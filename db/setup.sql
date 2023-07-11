DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

\c test;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100)
);

INSERT INTO users
(username)
VALUES
('harcas'),
('guest');

CREATE TABLE categories (
    category_name VARCHAR PRIMARY KEY
);

INSERT INTO categories
(category_name)
VALUES
('Electronics'),
('Clothing'),
('Household'),
('Misc');

CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    details VARCHAR(200),
    img_url VARCHAR,
    price INT,
    category_name VARCHAR REFERENCES categories(category_name)
);

INSERT INTO items
(item_name, details, img_url, price, category_name)
VALUES
('Gameboy', 'Pokemon blue anyone?', 'https://images.unsplash.com/photo-1631896928992-90e5a2cc7a4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80', 1599, 'Electronics');

CREATE TABLE baskets (
    basket_id SERIAL PRIMARY KEY,
    item_id INT REFERENCES items(item_id),
    user_id INT REFERENCES users(user_id)
);

INSERT INTO baskets
(item_id, user_id)
VALUES
(1, 1);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    item_id INT REFERENCES items(item_id),
    user_id INT REFERENCES users(user_id)
);

WITH item_json (doc) as (
    VALUES
    ('[
        {
            "item_name": "Blender",
            "details": "A kitchen appliance used for blending food and drinks",
            "img_url": "https://images.unsplash.com/photo-1585237672814-8f85a8118bf6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 59,
            "category_name": "Household"
        },
        {
            "item_name": "Cactus",
            "details": "Spiky",
            "img_url": "https://images.unsplash.com/photo-1521503862198-2ae9a997bbc9?fit=crop&w=600&h=600&q=80",
            "price": 899,
            "category_name": "Household"
        },
        {
            "item_name": "Chess Board",
            "details": "You could be the next Magnus Carlsen",
            "img_url": "https://images.unsplash.com/photo-1596507457972-0ab33221e1cf?fit=crop&w=600&h=600&q=80",
            "price": 2500,
            "category_name": "Household"
        },
        {
            "item_name": "Coffee Maker",
            "details": "An appliance used for brewing coffee",
            "img_url": "https://images.unsplash.com/photo-1565452344518-47faca79dc69?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 49,
            "category_name": "Household"
        },
        {
            "item_name": "Denim Jacket",
            "details": "Mens luxury jacket",
            "img_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9pdMPsfCnAULZo_dOiJo9XvPZnb5jFoODhw&usqp=CAU",
            "price": 300000,
            "category_name": "Clothing"
        },
        {
            "item_name": "Desktop Microphone",
            "details": "Crystal clear quality on all your zoom calls",
            "img_url": "https://images.unsplash.com/photo-1583593711082-aaa381feb2f1?fit=crop&w=600&h=600&q=80",
            "price": 9000,
            "category_name": "Electronics"
        },
        {
            "item_name": "dnskandsa",
            "details": "",
            "img_url": "https://dsa.com",
            "price": 1999,
            "category_name": "Electronics"
        },
        {
            "item_name": "Drawing Tablet",
            "details": "As made famous by terrible handwriting in northcoders lectures",
            "img_url": "https://images.unsplash.com/photo-1569323112693-492fe7ec1d3b?fit=crop&w=600&h=600&q=80",
            "price": 4000,
            "category_name": "Electronics"
        },
        {            "item_name": "Drinks Globe",
            "details": "Booze and geography combined",
            "img_url": "https://images.unsplash.com/photo-1553304961-2ec9700cf283?fit=crop&w=600&h=600&q=80",
            "price": 1800,
            "category_name": "Household"
        },
        {
            "item_name": "Drone",
            "details": "Think of all the cool aerial fly overs youll be able to take",
            "img_url": "https://images.unsplash.com/photo-1591105575839-1fb30d5ce4a5?fit=crop&w=600&h=600&q=80",
            "price": 6000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Duct Tape",
            "details": "Can be used to achieve literally anything. Case in point - a gravity defying banana.",
            "img_url": "https://images.unsplash.com/photo-1575846250428-cffcf571b04e?fit=crop&w=600&h=600&q=80",
            "price": 899,
            "category_name": "Household"
        },
        {
            "item_name": "Electric guitar",
            "details": "This one goes up to eleven",
            "img_url": "https://images.unsplash.com/photo-1592922823354-c48e6d894bbe?fit=crop&w=600&h=600&q=80",
            "price": 2000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Flying beakfast",
            "details": "pigs to fly",
            "img_url": "https://w7.pngwing.com/pngs/449/301/png-transparent-daddy-pig-princess-peppa-peppa-pig-peppa-pig-child-animals-poster-thumbnail.png",
            "price": 1000,
            "category_name": "Household"
        },
        {
            "item_name": "Golden arch 3",
            "details": "saddsa",
            "img_url": "https://img.freepik.com/free-vector/gradient-golden-luxury-frame-template_23-2149056079.jpg?w=740&t=st=1685096982~exp=1685097582~hmac=0524b62794cfa733a9ae32e2256f6fcc6d56675b48d54338560e83d46097f874",
            "price": 12554,
            "category_name": "Household"
        },
        {            "item_name": "Headphones",
            "details": "The coding equivalent of a do not disturb sign",
            "img_url": "https://images.unsplash.com/photo-1528575950036-63c4853d3f6f?fit=crop&w=600&h=600&q=80",
            "price": 3000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Hoodie",
            "details": "A type of sweatshirt with a hood",
            "img_url": "https://images.unsplash.com/photo-1556821840-3a63f95609a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 39,
            "category_name": "Clothing"
        },
        {
            "item_name": "iPhone",
            "details": "Apples latest smartphone model",
            "img_url": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 799,
            "category_name": "Electronics"
        },
        {
            "item_name": "Jeans",
            "details": "A type of pants made from denim",
            "img_url": "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 39,
            "category_name": "Clothing"
        },
        {
            "item_name": "Laptop",
            "details": "A portable computer for personal use",
            "img_url": "https://images.unsplash.com/photo-1575024357670-2b5164f470c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 599,
            "category_name": "Electronics"
        },
        {            "item_name": "Laptop stickers",
            "details": "Let the world know about all the cool tech youre into... or just fill it with random nonsense, you do you :D ",
            "img_url": "https://images.unsplash.com/photo-1589384267710-7a170981ca78?fit=crop&w=600&h=600&q=80",
            "price": 600,
            "category_name": "Electronics"
        },
        {
            "item_name": "Lego",
            "details": "this is lego",
            "img_url": "https://www.lego.com/cdn/cs/set/assets/blt8fa82af2949ffc86/31139.png",
            "price": 200,
            "category_name": "Household"
        },
        {
            "item_name": "Lego",
            "details": "this is lego",
            "img_url": "https://www.lego.com/cdn/cs/set/assets/blt8fa82af2949ffc86/31139.png",
            "price": 200,
            "category_name": "Household"
        },
        {
            "item_name": "Lego",
            "details": "this is lego",
            "img_url": "https://www.lego.com/cdn/cs/set/assets/blt8fa82af2949ffc86/31139.png",
            "price": 200,
            "category_name": "Household"
        },
        {
            "item_name": "Lego",
            "details": "this is lego",
            "img_url": "https://www.lego.com/cdn/cs/set/assets/blt8fa82af2949ffc86/31139.png",
            "price": 200,
            "category_name": "Household"
        },
        {
            "item_name": "Lego",
            "details": "this is lego",
            "img_url": "https://www.lego.com/cdn/cs/set/assets/blt8fa82af2949ffc86/31139.png",
            "price": 200,
            "category_name": "Household"
        },
        {
            "item_name": "Light up suit",
            "details": "Ideal for raves",
            "img_url": "https://images.unsplash.com/photo-1509817445409-e2057fd6feac?fit=crop&w=600&h=600&q=80",
            "price": 10000,
            "category_name": "Clothing"
        },
        {
            "item_name": "Microwave",
            "details": "A kitchen appliance used for cooking and heating food",
            "img_url": "https://images.unsplash.com/photo-1655354440373-4950ff34df3c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 79,
            "category_name": "Household"
        },
        {            "item_name": "New iMac",
            "details": "Good lord is it pretty",
            "img_url": "https://images.unsplash.com/photo-1515248137880-45e105b710e0?fit=crop&w=600&h=600&q=80",
            "price": 100000000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Plain White T",
            "details": "A modern classic",
            "img_url": "https://images.unsplash.com/photo-1581655353564-df123a1eb820?fit=crop&w=600&h=600&q=80",
            "price": 799,
            "category_name": "Clothing"
        },
        {
            "item_name": "Pocket Watch",
            "details": "What time is it? Time you got a watch",
            "img_url": "https://images.unsplash.com/photo-1509048191080-d2984bad6ae5?fit=crop&w=600&h=600&q=80",
            "price": 8000,
            "category_name": "Clothing"
        },
        {
            "item_name": "Pre ripped jeans",
            "details": "Get some jeans that have seen it all without having to go through all those awkward life experiences yourself",
            "img_url": "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?fit=crop&w=600&h=600&q=80",
            "price": 1700,
            "category_name": "Clothing"
        },
        {
            "item_name": "Raincoat",
            "details": "Perfect for exploring the great outdoors",
            "img_url": "https://images.unsplash.com/photo-1537045439788-4e69f886651a?fit=crop&w=600&h=600&q=80",
            "price": 3999,
            "category_name": "Clothing"
        },
        {            "item_name": "React Native online tutorials",
            "details": "Are React and React Native the same thing though?",
            "img_url": "https://images.unsplash.com/photo-1518773553398-650c184e0bb3?fit=crop&w=600&h=600&q=80",
            "price": 1099,
            "category_name": "Electronics"
        },
        {
            "item_name": "Satchel",
            "details": "Perfectly laptop sized",
            "img_url": "https://images.unsplash.com/photo-1484606067694-f2f9b209a225?fit=crop&w=600&h=600&q=80",
            "price": 1800,
            "category_name": "Clothing"
        },
        {
            "item_name": "See through desktop case",
            "details": "Cat not included",
            "img_url": "https://images.unsplash.com/photo-1607034071833-18a5b64047ac?fit=crop&w=600&h=600&q=80",
            "price": 2000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Smart TV",
            "details": "A television with advanced features and internet connectivity",
            "img_url": "https://images.unsplash.com/photo-1542487354-feaf93476caa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 599,
            "category_name": "Electronics"
        },
        {
            "item_name": "Smartwatch",
            "details": "A wristwatch with advanced features",
            "img_url": "https://images.unsplash.com/photo-1544117519-31a4b719223d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx&fit=crop&w=600&h=600&q=80",
            "price": 349,
            "category_name": "Electronics"
        },
        {
            "item_name": "Sneakers",
            "details": "A type of athletic shoe for casual wear",
            "img_url": "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 59,
            "category_name": "Clothing"
        },
        {
            "item_name": "Sofa",
            "details": "A piece of furniture for seating multiple people",
            "img_url": "https://images.unsplash.com/photo-1540574163026-643ea20ade25?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 499,
            "category_name": "Household"
        },
        {
            "item_name": "Standing desk",
            "details": "Great for your posture whilst coding all day",
            "img_url": "https://images.unsplash.com/photo-1599502452965-df0824971bb2?fit=crop&w=600&h=600&q=80",
            "price": 5000,
            "category_name": "Household"
        },
        {
            "item_name": "Surf Board",
            "details": "Surfs up dude",
            "img_url": "https://images.unsplash.com/photo-1528150177508-7cc0c36cda5c?fit=crop&w=600&h=600&q=80",
            "price": 4000,
            "category_name": "Household"
        },
        {
            "item_name": "Tablet",
            "details": "A portable computer with a touch screen",
            "img_url": "https://images.unsplash.com/photo-1625864667534-aa5208d45a87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 299,
            "category_name": "Electronics"
        },
        {
            "item_name": "Ted",
            "details": "a nice small westie",
            "img_url": "https://photos.app.goo.gl/cfJncHgBmXtdUAoV7",
            "price": 999,
            "category_name": "Household"
        },
        {
            "item_name": "T-Shirt",
            "details": "A casual short-sleeved shirt",
            "img_url": "https://images.unsplash.com/photo-1581655353564-df123a1eb820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&fit=crop&w=600&h=600&q=80",
            "price": 19,
            "category_name": "Clothing"
        },
        {
            "item_name": "Ultra-wide Monitor",
            "details": "Capable of opening over 200 browser tabs simultaneously",
            "img_url": "https://images.unsplash.com/photo-1606127195437-d12564b184e9?fit=crop&w=600&h=600&q=80",
            "price": 30000,
            "category_name": "Electronics"
        },
        {
            "item_name": "Watch",
            "details": "What time is it? Time you got a watch",
            "img_url": "https://images.unsplash.com/photo-1518131672697-613becd4fab5?fit=crop&w=600&h=600&q=80",
            "price": 7000,
            "category_name": "Clothing"
        },
        {
            "item_name": "Wicker Chair",
            "details": "Cat not included",
            "img_url": "https://images.unsplash.com/photo-1607165993340-633148469d1f?fit=crop&w=600&h=600&q=80",
            "price": 2000,
            "category_name": "Household"
        },
        {
            "item_name": "Wooden Chair",
            "details": "A real vintage feel",
            "img_url": "https://images.unsplash.com/photo-1602592867152-ba321a437ff0?fit=crop&w=600&h=600&q=80",
            "price": 2800,
            "category_name": "Household"
        }
    ]'::json)
)
INSERT INTO items
(item_name, details, img_url, price, category_name)
SELECT item_name, details, img_url, price, category_name FROM item_json vals
    CROSS JOIN LATERAL json_populate_recordset(null::items, doc);