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