-- Definimos una tabla local que servirá como nuestro módulo de datos
local Modulo = {
	-- Indica si el sonido del juego está activado (verdadero) o no
	sonido_activado = true,
	-- Almacena el daño acumulado por veneno que sufre el jugador
	daño_veneno = 0,
	-- Guarda el nombre del estado o escena actual (ej: "menu", "nivel_1")
	escena_actual = "menu",

	-- Puntos de vida actuales del jugador
	vida_actual = 100,
	-- Puntos de vida máximos que el jugador puede tener
	vida_maxima = 100,
	-- Cantidad de armadura o defensa del jugador
	armadura = 0,

	-- Experiencia acumulada actual
	experiencia = 0,
	-- Experiencia necesaria para subir al siguiente nivel
	experiencia_necesaria = 25,
	-- Nivel actual del personaje (Jugador)
	nivel_jugador = 1,

	-- Cantidad de veces que se puede usar la habilidad de ataque (o nivel de la misma)
	cantidad_habilidad_ataque = 1,
	-- Booleano para saber si el jugador tiene el objeto "hacha"
	tiene_hacha = false,
	-- Booleano para saber si el jugador tiene el objeto "trampa"
	tiene_trampa = false,

	-- Velocidad de movimiento del jugador
	velocidad = 300,

	-- Configuración de estadísticas para el enemigo "Murciélago"
	murcielago = {
		velocidad = 100, -- Velocidad de movimiento del murciélago
		vida = 40,       -- Vida total del murciélago
		ataque = 12      -- Daño que hace el murciélago
	},
	-- Configuración de estadísticas para el enemigo "Fantasma"
	fantasma = {
		velocidad = 150, -- Velocidad del fantasma
		vida = 100,      -- Vida del fantasma
		ataque = 15      -- Daño del fantasma
	},
	-- Configuración de estadísticas para el enemigo "Esqueleto"
	esqueleto = {
		velocidad = 130, -- Velocidad del esqueleto
		vida = 200,      -- Vida del esqueleto
		ataque = 25      -- Daño del esqueleto
	},
}

-- Función para reiniciar todos los valores del juego a su estado original
function Modulo.reiniciar_juego()
	-- Resetea el daño por veneno a 0
	Modulo.daño_veneno = 0
	-- Restaura la vida actual al valor inicial (100)
	Modulo.vida_actual = 100
	-- Restaura la vida máxima al valor inicial (100)
	Modulo.vida_maxima = 100
	-- Quita toda la armadura (0)
	Modulo.armadura = 0
	-- Resetea la experiencia a 0
	Modulo.experiencia = 0
	-- Resetea la experiencia necesaria para el primer nivel (25)
	Modulo.experiencia_necesaria = 25
	-- Devuelve al jugador al nivel 1
	Modulo.nivel_jugador = 1
	-- Restaura la cantidad de habilidad de ataque a 1
	Modulo.cantidad_habilidad_ataque = 1
	-- Quita el hacha del inventario
	Modulo.tiene_hacha = false
	-- Quita la trampa del inventario
	Modulo.tiene_trampa = false
end

-- Función para establecer (setear) la vida actual y máxima manualmente
function Modulo.establecer_vida(vida, vida_maxima)
	-- Asigna el valor pasado como argumento a la variable vida_actual
	Modulo.vida_actual = vida
	-- Asigna el valor pasado como argumento a la variable vida_maxima
	Modulo.vida_maxima = vida_maxima
end

-- Función para obtener los valores de vida (útil para mostrar en la interfaz/UI)
function Modulo.obtener_vida()
	-- Retorna dos valores: la vida actual y la vida máxima
	return Modulo.vida_actual, Modulo.vida_maxima
end

-- Función para establecer la experiencia actual y la necesaria para el siguiente nivel
function Modulo.establecer_experiencia(exp, exp_necesaria)
	-- Actualiza la experiencia actual
	Modulo.experiencia = exp
	-- Actualiza el tope de experiencia necesaria
	Modulo.experiencia_necesaria = exp_necesaria
end

-- Función para obtener los datos de experiencia
function Modulo.obtener_experiencia()
	-- Retorna la experiencia actual y la necesaria
	return Modulo.experiencia, Modulo.experiencia_necesaria
end

-- Función para definir el nivel del jugador
function Modulo.establecer_nivel(nivel)
	-- Actualiza la variable de nivel del jugador
	Modulo.nivel_jugador = nivel
end

-- Función para leer el nivel actual del jugador
function Modulo.obtener_nivel()
	-- Retorna el nivel actual
	return Modulo.nivel_jugador
end

-- Función para cambiar la velocidad del jugador
function Modulo.establecer_velocidad(velocidad)
	-- Actualiza la variable de velocidad
	Modulo.velocidad = velocidad
end

-- Función para leer la velocidad actual
function Modulo.obtener_velocidad()
	-- Retorna la velocidad
	return Modulo.velocidad
end

-- Función para asignar armadura al jugador
function Modulo.establecer_armadura(armadura)
	-- Actualiza la variable de armadura
	Modulo.armadura = armadura
end

-- Función para leer cuánta armadura tiene el jugador
function Modulo.obtener_armadura()
	-- Retorna el valor de armadura
	return Modulo.armadura
end

-- Devuelve la tabla completa del módulo para que pueda ser usada en otros scripts con 'require'
return Modulo