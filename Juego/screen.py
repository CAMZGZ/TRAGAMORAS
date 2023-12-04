import kivy
#kivy.require('2.2.1') # replace with your current kivy version !

from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.gridlayout import GridLayout
from kivy.lang import Builder
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.clock import Clock
from kivy.config import Config
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.graphics import RoundedRectangle, Color
from kivy.graphics import Ellipse, Color
from kivy.uix.popup import Popup
from random import randint
from kivy.uix.image import AsyncImage
import mysql.connector
import serial
import time
import datetime

Config.set('graphics','fullscreen','auto')

class WinPopup(Popup):
    pass
    
class LosePopup(Popup):
    pass
    
class Registro():
    def __init__(self, **kwargs):
        super(Registro, self).__init__(**kwargs)
        self.DATA = None
        self.ser= None
        
    def leer_tarjeta(self):
        #print('FUNCIONO')
        if not self.ser:
                print('hola')
                self.ser = serial.Serial('/dev/ttyACM0', 9600, timeout=3) # create a serial object
        self.ser.write(b'1')
        #leer serial
        self.ser.readline()
        time.sleep(0.020)
        data = self.ser.readline().decode()#.strip() # read the data from the serial port
        print(datetime.datetime.now(),data) # update the label with the received data
        self.ser.readline()
        # Actualiza la etiqueta en la instancia de SlotMachine
        #print(self.slot_machine.ids.id_rfid.text)
        """
        if not data :
                self.ser.write(b'0')
        """
        if len(data.strip()) >= 6:
                #print(':>')
                self.DATA = data.strip()  # Reemplaza 'data' con tus datos reales
        self.ser.flush()
          
class Inicio(Screen):
    def __init__(self, **kwargs):
        super(Inicio, self).__init__(**kwargs)
        self.registro = None
    
    def leer_tarjeta(self, instance):
        app = App.get_running_app()
        print(':z')
        print(app.root)
        print(app.root.Reg)
        if not self.registro:
            self.registro = app.root.Reg
        self.registro.leer_tarjeta()
        if self.registro.DATA:
            self.ids.tarjeta_rfid.text = self.registro.DATA
        
class Juego(Screen):
    def __init__(self, **kwargs):
        super(Juego, self).__init__(**kwargs)
        self.registro = None
        self.ganar = 1
        self.w = WinPopup()
        self.l = LosePopup()
        #self.c2 = 0

    def cerrar_win(self, instance):
        self.w.dismiss

    def cerrar_lose(self, instance):
        self.l.dismiss
        
    def show_winner_popup(self):
        #content = Label(text="¡GANASTE!", font_size=50)
        #popup = Popup(content=content, title="Resultado")
        self.w.open()
        # Programa el cierre del mensaje emergente después de 3 segundos
        # Clock.schedule_once(popup.dismiss, 2)

    def show_lose_popup(self):
        #content = Label(text="¡PERDISTE!", font_size=50)
        #popup = Popup(content=content, title="Resultado")
        self.l.open()
        # Programa el cierre del mensaje emergente después de 3 segundos
        # Clock.schedule_once(popup.dismiss, 2)
                
    def change_numbers(self, instance):
        if self.counter >= 8:
           numbers = [randint(1, 6) for i in range(3)]
           self.ids.result_label1.text = str(numbers[0])
           self.ids.result_label2.text = str(numbers[1])
           self.ids.result_label3.text = str(numbers[2])
           # Verifica si los tres números son iguales
           if numbers[0] == numbers[1] == numbers[2]:
              self.show_winner_popup()
              self.ganar = 2
           else:
              self.show_lose_popup()
              self.ganar = 1
           self.ids.spin_button.disabled = False
           return False
        self.counter += 1
        numbers = [randint(1, 6) for i in range(3)]
        self.ids.result_label1.text = str(numbers[0])
        self.ids.result_label2.text = str(numbers[1])
        self.ids.result_label3.text = str(numbers[2])
        Clock.schedule_once(self.change_numbers, 1)
                    
    def spin(self, instance):
        self.ids.spin_button.disabled = True
        app = App.get_running_app()
        print(':z')
        print(app.root)
        print(app.root.Reg)
        if not self.registro:
            self.registro = app.root.Reg
        self.counter = 0
        Clock.schedule_once(self.change_numbers, 1)
        """
        if self.c2 == 2:
            numbers = [1,1,1]
            self.ids.result_label1.text = '1'
            self.ids.result_label2.text = '1'
            self.ids.result_label3.text = '1'
        else:
        """
        """
        else:
            self.c2 += 1
        """
        # Obtén el valor de la tarjeta RFID desde 'data'
        id_tarjeta = self.registro.DATA
        
        print(id_tarjeta)
        """
        #Definir coneccion a db
        mydb = mysql.connector.connect(
                host = "192.168.39.139",
                user = "moneda",
                passwd = "Dragon",
                database = "juego"
            )
        #Crear cursosr de db
        c = mydb.cursor()
        print(id_tarjeta)
         # Consulta SQL para insertar datos con 'id_tarjeta' PERDER
        sql = "INSERT INTO movimientos (monto, tipo_movimiento_id, tarjeta_id) VALUES (10, %s, %s)"
        values = [self.ganar, id_tarjeta]
        if self.ganar == 1:
            sql2 = "UPDATE tarjetas SET creditos = creditos -10 WHERE id = %s"
            values2 = [id_tarjeta]
        else:
            sql2 = "UPDATE tarjetas SET creditos = creditos +10 WHERE id = %s"
            values2 = [id_tarjeta]
                
        c.execute(sql, values)
        #c.execute(sql2, values2)
        #guardar cambios
        mydb.commit()
        #Cerrar conexion
        mydb.close()
        """
        

class WindowManager(ScreenManager):
    def __init__(self, **kwargs):
        super(WindowManager, self).__init__(**kwargs)
        self.Reg = Registro()
         
class SlotMachineApp(App):
    def build(self):
        return Builder.load_file('ventana.kv')
    
if __name__ == '__main__':
    SlotMachineApp().run()
    """
    192.168.39.139
    """
