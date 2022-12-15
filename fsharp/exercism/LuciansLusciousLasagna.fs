module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven timeSoFar = expectedMinutesInOven - timeSoFar

let preparationTimeInMinutes layers = layers * 2

let elapsedTimeInMinutes layers timeSoFar =
    preparationTimeInMinutes layers + timeSoFar
