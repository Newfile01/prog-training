# TOUR-LAB - Boucles & Conditions

Source : [Boucles & conditions](https://go.dev/tour/flowcontrol/1)

# Boucles : For

En Go il n'y a qu'une seule structure de boucle : `for`

Elle est composée de 3 parties :

- L'intialisation
- La condition à tester avant chaque itération
- L'action à réaliser à chaque fin d'itération

```go
func main() {
	sum := 0
	fmt.Printf("Somme %v >> ", sum)
	for i := 0; i < 10; i++ {
		fmt.Printf("%v + %v | \n", sum, i)
		sum += i
		fmt.Printf("Somme %v >> ", sum)
	}
}
```

Contrairement au langage C il n'y à pas de `()` mais les `{}` sont requises

Par ailleurs , l'initialisation est optionnelle :

```go
func main() {
	sum := 1
	for ; sum < 1000; {
		sum += sum
	}
	fmt.Println(sum)
}
```

## Equivalent du `while`

Le `for`sert de `while`en enlevant les points-virgules
```go
func main() {
	sum := 1
	for sum < 1000 {
		sum += sum
	}
	fmt.Println(sum)
}
```

Et pour une boucle infinie on enlève tout :
```go
func main() {
	for {
	}
}
```

---

## Conditions : `if`

Idem, pas besoin de parenthèses mais les accolades sont requises :
```go
import (
	"fmt"
	"math"
)

func sqrt(x float64) string {
	if x < 0 {
		return sqrt(-x) + "i"
	}
	return fmt.Sprint(math.Sqrt(x))
}

func main() {
	fmt.Println(sqrt(2), sqrt(-4))
}
```

Comme pour le `for`il est possible d'exécuter une instruction avant le test de la condition :
```go
func pow(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	}
	return lim
}
```

Les variables dans les instructions d'initialisations de sont qu'au scope de la condition ou de la boucle.
Elles le sont aussi pour le e`else`qui suivrait :
```go
func pow(x, n, lim float64) float64 {
	if v := math.Pow(x, n); v < lim {
		return v
	} else {
		fmt.Printf("%g >= %g\n", v, lim)
	}
	// can't use v here, though
	return lim
}
```

---

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

Observer à partir de quel moment la précision devient peu intéressante :

```go
package main

import (
	"fmt"
)

func Sqrt(x float64) (z float64) {
	zPrec := 0.0
	zSuiv := 0.0
	z = 1.0
	
	for i := 1; i <= 10; i++ {
		zPrec = z
		
		z -= (z*z-x)/(2*z)
		
		fmt.Printf("\n (%2v) %9.15v ", i, z)
		zSuiv = z
		
		fmt.Printf(" [ D = %2.4v ]", zPrec-zSuiv)
	}
	return
}

func main() {
	Sqrt(2)
}
```

En changeant la condition de la boucle pour qu'elle s'arrête lorsque les changements deviennent insiginfiants :

```go
package main

import (
	"fmt"
	"math"
)

func Sqrt(x float64) (z float64) {
	zPrec := 0.0
	zSuiv := 0.0
	z = x/2
	
	for i := 1; i <= 6; i++ {
		zPrec = z
		
		z -= (z*z-x)/(2*z)
		
		fmt.Printf("\n (%2v) %9.15v ", i, z)
		zSuiv = z
		
		fmt.Printf(" [ Z%v-Z%v = %2.4v ]", i-1, i, zPrec-zSuiv)
	}
	return
}

func main() {
	Sqrt(2)
	fmt.Printf("\n Math.Sqrt = %9.15v", math.Sqrt(2))
}
```

---

## Switch case

Même syntaxe qu'en langage C sans avoir besoin de mettre le `break` qui est induit automatiquement en Go :

Exemple pour tester et afficher le bon OS de l'environnement d'exécution
```go
package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Print("Go runs on ")
	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("macOS.")
	case "linux":
		fmt.Println("Linux.")
	default:
		// freebsd, openbsd,
		// plan9, windows...
		fmt.Printf("%s.\n", os)
	}
}
```

> [!TIP]
> Noter que la valeur à tester n'est pas nécessairement une contante (ici on utilise une fonction pour la récupérer)

La structure `switch true` (sans condition) permet de faire l'équivalent de long `if-then-else` :

```go
func main() {
	t := time.Now()
	switch {
	case t.Hour() < 12:
		fmt.Println("Good morning!")
	case t.Hour() < 17:
		fmt.Println("Good afternoon.")
	default:
		fmt.Println("Good evening.")
	}
}
```

---

## Defer

Cette structure permet d'évaluer un argument sans exécuter immédiatement l'appel à la fonction sous-jacente.
L'appel à la fonction sera fait lorsque la fonction supérieure aura effectué son retour :

```go
package main

import "fmt"

func main() {
	defer fmt.Println("world")
	defer fmt.Println("Salut")

	fmt.Println("hello")
}

// Renverra "hello" puis "Salut" puis "world" (en remontant vers le début de 'main')
```

Les fonctions déferrées son empilées et exécutées du dernier au premier empilé :

```go
package main

import "fmt"

func main() {
	fmt.Println("counting")

	for i := 0; i < 10; i++ {
		defer fmt.Println(i)
	}

	fmt.Println("done")
}
// Affichera de 9 à 0 dans l'ordre décroissant
```