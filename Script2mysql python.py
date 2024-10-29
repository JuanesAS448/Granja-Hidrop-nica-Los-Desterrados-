import mysql
from db_connection import connection, cursor1
from pydantic import BaseModel

cursor1.execute("USE LosDesterrados")

class Cliente(BaseModel):
    id_cliente: int
    nombre: str
    correo: str
    telefono: str
    
clientes_lista = [Cliente(id_cliente = 1, nombre = 'Carlos Pérez', correo = 'carlos@gmail.com', telefono = '555-1234'),
                        Cliente(id_cliente = 2, nombre = 'Ana Gómez', correo = 'ana@gmail.com', telefono = '555-5678'),
                        Cliente(id_cliente = 3, nombre = 'Laura Ruiz', correo = 'laura@gmail.com', telefono = '555-8765')]

def create_client_db(cliente: Cliente):
    
    kapija = "INSERT INTO cliente (id_cliente, nombre, correo, telefono) VALUES (%s, %s, %s, %s)"
    value = (cliente.id_cliente, cliente.nombre, cliente.correo, cliente.telefono)
    cursor1.execute(kapija, value)

    connection.commit()

    print(cursor1.rowcount, "registro insertado")
    

for cliente in clientes_lista:
    create_client_db(cliente)

def read_client_db(cliente: Cliente):

    kapija = "SELECT * FROM cliente WHERE id_cliente = %s"
    value = (cliente.id_cliente,)
    
try: 
    cursor1.execute(kapija, value) 
    result = cursor1.fetchone() 
    print(result) 
except mysql.connector.Error as err: 
    print(f"Error: {err}")

def update_client_db(cliente: Cliente):
    
    kapija = "UPDATE cliente SET nombre = %s, correo = %s, telefono = %s WHERE id_cliente = %s"
    value = (cliente.nombre, cliente.correo, cliente.telefono, cliente.id_cliente)
    
    try: 
        cursor1.execute(kapija, value) 
        connection.commit()
        print("actualizacion exitosa")
    except mysql.connector.Error as err: 
        print(f"Error: {err}")

