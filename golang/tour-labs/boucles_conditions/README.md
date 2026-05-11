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

