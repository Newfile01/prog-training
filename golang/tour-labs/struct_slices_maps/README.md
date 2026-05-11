# TOUR-LABS : Struct, Slices & Maps

## Pointer

Les pointeurs en Go ressemble au langage C :

```go
package main

import "fmt"

func main() {
	i, j := 42, 2701

	p := &i         // point to i
	fmt.Println(p) // read i's address through the pointer
	fmt.Println(*p) // read i through the pointer
	*p = 21         // set i through the pointer
	fmt.Println(i)  // see the new value of i

	p = &j         // point to j
	*p = *p / 37   // divide j through the pointer
	fmt.Println(j) // see the new value of j
}
```

`*T` est un pointeur de la valeur `T`. Il stocke l'adresse mémoire.
`*` permet d'accéder à la valeur pointée
`&` permet de passer une adresse au pointeur

Cette méthode d'accès aux valeurs est aussi appelée "dereferencing" ou "indirecting"

---

## Struct

Une structure est un assemblage de champs. Il définissent un novueau type de variable.
La variable d'un type `struct` est déclaré comme suit : `var.Structure{Champs1, Champs2, ...}`
Les champs de la structure sont accessible via `nom.Champ`

```go
package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

func main() {
	v := Vertex{1, 2}
	v.X = 4
	fmt.Println(v.X)

    p := &v

// 1ere méthode d'accès à un champ de la structure pointée par 'p' (plus simple)
	p.X = 1e9
    fmt.Println(v.X)

// 2e méthode d'accès (redondante)
    (*p).X = 1e7
    fmt.Println(v)
}
```

Golang permet de s'abstraire de la double mention du pointage loprsqu'on souhaite accéder à une valeur d'un champ de la structure pointée.


Autre façon d'écrire une structure en ligne et d'"accéder aux valeurs des champs avec `Name:`

```go
package main

import "fmt"

type Vertex struct {
	X, Y int
}

var (
	v1 = Vertex{1, 2}  // has type Vertex
	v2 = Vertex{X: 1}  // Y:0 is implicit
	v3 = Vertex{}      // X:0 and Y:0
	p  = &Vertex{1, 2} // has type *Vertex
)

func main() {
	fmt.Println(v1, p, v2, v3)
}
// Affiche {1 2} &{1 2} {1 0} {0 0}
```

---

## Arrays

Les tableaux sont de forme `[n]T` où `n` représente le nombre de valeur contenu dans le tableau et `T` le type de ces valeurs.
Comme en langage C, on accède aux valeurs via leur indice

```go
package main

import "fmt"

func main() {
	var a [2]string
	a[0] = "Hello"
	a[1] = "World"
	fmt.Println(a[0], a[1])
	fmt.Println(a)

	primes := [6]int{2, 3, 5, 7, 11, 13}
	fmt.Println(primes)
}
```

Chacun des appels de talbeau suivant donne le même résultat :

```go
a[0:10]
a[:10]
a[0:]
a[:]
```


## Slices

Ce sont des morceau de talbeaux. 
Se déclare sous la forme `[]T` avec T le type du tableau à slicer
On leur attribut une valeur avec des indices bas et haut : `tableau[low:high]`
L'indice bas est pris en compte et l'indice haut est exclu de la valeur du slice




```go
package main

import "fmt"

func main() {
	primes := [6]int{2, 3, 5, 7, 11, 13}

	var s []int = primes[1:4]
	fmt.Println(s)
}
```

Ils reposent sur des tableaux mais ne stockent pas de variables supplémentaire en mémoire.
En revanche si on modifie un slice on modifie le tableau sur lequel il repose.

Dans l'exemple suivant par exemple on voit :
- Un tableau de 4 noms
- 1 slice de 0 à 2 (donc names[0] et names[1])
- 1 slice de 1 à 3 (donc names[1] et names[2])
- midification du [0] du 2eme slice soit de names[1]

```go
func main() {
	names := [4]string{
		"John",
		"Paul",
		"George",
		"Ringo",
	}
	fmt.Println(names)

	a := names[0:2]
	b := names[1:3]
	fmt.Println(a, b)

	b[0] = "XXX"
	fmt.Println(a, b)
	fmt.Println(names)
}
```

Dans l'exemple suivant on voit :
- La création d'un slice d'un tableau "litéral" int
- Idem pour un slice d'un tableau booléen
- Une structure avec un slice d'un tableau à 2 dimensions

> [!NOTE]
> La forme de la structure est à noter et doit être respectée

```go
import "fmt"

func main() {
	q := []int{2, 3, 5, 7, 11, 13}
	fmt.Println(q)

	r := []bool{true, false, true, true, false, true}
	fmt.Println(r)

	s := []struct {
		i int
		b bool
	}{
		{2, true},
		{3, false},
		{5, true},
		{7, true},
		{11, false},
		{13, true},
	}
	fmt.Println(s)
}
```

Il est aussi possible d'utiliser les valeurs par défaut :

```go
func main() {
	s := []int{2, 3, 5, 7, 11, 13}

	s = s[1:4]
	fmt.Println(s)

	s = s[:2]
	fmt.Println(s)

	s = s[1:]
	fmt.Println(s)
}
```

Si on omet la valeur basse elle définit elle reviendra à 0
Si on omet la valeur haute elle se rapportera à la longueur du slice