package main

import (
	"fmt"
	"log"
	"os"
	"strconv"

	"github.com/dustinspecker/combined-coverage-demo/internal/calculator"
)

func main() {
	if len(os.Args) != 3 {
		log.Fatal("expected two numbers as arguments")
	}

	a, err := strconv.Atoi(os.Args[1])
	if err != nil {
		log.Fatalf("expected %q to be an int", os.Args[1])
	}

	b, err := strconv.Atoi(os.Args[2])
	if err != nil {
		log.Fatalf("expected %q to be an int", os.Args[2])
	}

	fmt.Println(calculator.Add(a, b))
}
