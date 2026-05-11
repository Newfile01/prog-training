# TOUR LAB - Basics

Source : [Basics](https://go.dev/tour/basics/1)

Exploration à travers le GoTour proposé sur le site officiel

## Packages

Chaque programme est composé de paquets `packages`
Ceux-ci portent le nom du dernier élément du chemin d'importation dans `import` par convention

Par exemple dans le paquet `packages.go`suivant :

```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	fmt.Println("My favorite number is", rand.Intn(10))
}

```

Le paquetage `math/rand` comprends les fichiers commençant par l'instruction "package rand"

--- 

## Import

Il est possible de lister les imports entre parenthèses ou de les mettre ligne par ligne avec le préfixe `import` :

```go
import (
	"fmt"
	"math"
)

# OU

import "fmt"
import "math"
```

--- 

## Exported names

Dans un paquetage, il n'estp ossible d'accéder qu'aux valeurs "exportables". Celle-ci commence **obligatoirement** par une majuscule
Par exemple, dans le paquet `math` la variable `pi` n'est pas exportable alors que `Pi` fonctionne.

```go
package main

import (
	"fmt"
	"math"
)

func main() {
	fmt.Println(math.Pi)
}
```

---

## Function

Une fonction peut prendre zéro ou plus arguments, par exemple ici on ajoute 2 nombres. 
> [!WARNING]
> Attention, le typage se trouve après le nom des variables

```go
package main

import "fmt"

func add(x int, y int) int {
	return x + y
}

func main() {
	fmt.Println(add(50, 13))
}
```

Il est possible de regrouper tous les paramètres d'un même type avant son annonce. Le dernier devra tout de même être précisé :

```go
func add(x, y int) int {
	return x + y
}
```

---

## Returns

Il est possible de retourner autant de résultats que désiré :

(ici 2 par ex.)
```go
func swap(x, y string) (string, string) {
	return y, x
}

func main() {
	a, b := swap("hello", "world")
	fmt.Println(a, b)
}
```

---

## Naked returns

Les variables de retour doivent être nommées en Go.
Si tel est le cas, elles sont traitées en tant que variables définies au début de la fonction :

Un `return` sans arguments est considéré comme `naked`et prendra en compte les variables nommées uniquement.
Il convient de l'utiliser pour de courtes fonctions comme l'exemple suivant :

```go
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}

func main() {
	fmt.Println(split(88))
	fmt.Println(4/9. * 88)
	fmt.Println(88 - 4/9. * 88)
}
```

---

## Declare variables

Pour déclarer des variables il est possible d'utiliser le mot clé `var`
Comme pour les fonctions, le types est déclaré à la fin de la liste :

```go
var c, python, java bool

func main() {
	var i int
	fmt.Println(i, c, python, java)
}
```

Il est aussi possible de rajouter les valeur d'initialisation (dans l'ordre des déclarations)
Si des valeurs d'initialisation sont indiquées il est possible d'omettre le type :

```go
var i, j int = 1, 2

func main() {
	var c, python, java = true, false, "no!"
	fmt.Println(i, j, c, python, java)
}
```

À l'intérieur d'une fonction il est aussi possible d'utilisater l'instruction `:=`à la place de `var`
En dehors il est nécessaire d'employer les mots clés appropriés

```go
func main() {
	var i, j int = 1, 2
	k := 3
	c, python, java := true, false, "no!"

	fmt.Println(i, j, k, c, python, java)
}
```

---

## Types

Il existe plusieurs types de variables en Go :

```go
bool

string

int  int8  int16  int32  int64
uint uint8 uint16 uint32 uint64 uintptr

byte // alias for uint8

rune // alias for int32
     // represents a Unicode code point

float32 float64

complex64 complex128
```

On peut les déclarer de façon factorisées comme pour les `imports`:

```go

import (
	"fmt"
	"math/cmplx"
)

var (
	ToBe   bool       = false
	MaxInt uint64     = 1<<64 - 1
	z      complex128 = cmplx.Sqrt(-5 + 12i)
)

func main() {
	fmt.Printf("Type: %T Value: %v\n", ToBe, ToBe)
	fmt.Printf("Type: %T Value: %v\n", MaxInt, MaxInt)
	fmt.Printf("Type: %T Value: %v\n", z, z)
}
```

> [!TIP]
> Si besoin d'un entier, il est préférable d'utiliser `ìnt` plutôt qu'`unint` à défaut d'avoir un réel besoin de limiter la place

Les variables sans valeurs initiales sont déclarées à zéro :

```go
0 for numeric types,
false for the boolean type, and
"" (the empty string) for strings.
```

---

## Transtypage

`T(v)` converti la valeur `v` en type `T`

```go

var i int = 42
var f float64 = float64(i)
var u uint = uint(f)

# OR easier

i := 42
f := float64(i)
u := uint(f)
```

Lorsque le type n'est pas déclaré il sera interprété au moment de l'attribution d'une valeur en fonction de celle-ci :

```go
func main() {
	v := 42.42 + 3i // change me!
	fmt.Printf("v is of type %T\n", v)
}

\\ Par exmple en changeant la valeur de v on obtient 

i := 42           // int
f := 3.142        // float64
g := 0.867 + 0.5i // complex128
```

Par ailleurs, si une variable est initialisé avec une autre, elle prendra le même type que celle-ci :

```go
var i int
j := i // j is an int
```

---

## Constantes

Les constantes sont déclarées avec le mot clé `const`
Elle ne peuvent pas l'être avec `:=`

```go
const Pi = 3.14

func main() {
	const World = "世界"
	fmt.Println("Hello", World)
	fmt.Println("Happy", Pi, "Day")

	const Truth = true
	fmt.Println("Go rules?", Truth)
}
```


## Exercices : Loops and Functions

Essai de racine carrée avec accentuation de la précision sur 10 passes :

```go
package main

import (
	"fmt"
)

func Sqrt(x float64) (z float64) {
	z = 1.0
	for i := 1; i <= 10; i++ {
		fmt.Printf("(%v) %v\n", i, z)
		z -= (z*z-x)/(2*z)
	}
	return
}

func main() {
	fmt.Println(Sqrt(2))
}
```

En changeant la condition de la boucle pour qu'elle s'arrête lorsque les changements deviennent insiginfiants :

```go

```


