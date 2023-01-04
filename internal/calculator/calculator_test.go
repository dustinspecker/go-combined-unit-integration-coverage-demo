package calculator_test

import (
	"testing"

	"github.com/dustinspecker/combined-coverage-demo/internal/calculator"
)

func TestAdd(t *testing.T) {
	testcases := []struct {
		a           int
		b           int
		expectedSum int
	}{
		{3, 4, 7},
		{-1, 0, -1},
	}

	for _, tt := range testcases {
		actual := calculator.Add(tt.a, tt.b)
		if actual != tt.expectedSum {
			t.Errorf("expected %d + %d to be %d, but got %d", tt.a, tt.b, tt.expectedSum, actual)
		}
	}
}

func TestMultiply(t *testing.T) {
	testcases := []struct {
		a               int
		b               int
		expectedProduct int
	}{
		{3, 4, 12},
		{-1, 0, 0},
	}

	for _, tt := range testcases {
		actual := calculator.Multiply(tt.a, tt.b)
		if actual != tt.expectedProduct {
			t.Errorf("expected %d x %d to be %d, but got %d", tt.a, tt.b, tt.expectedProduct, actual)
		}
	}
}
