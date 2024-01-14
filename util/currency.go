package util

// constant for all support currencies
const (
	USD = "USD"
	EUR = "EUR"
	THB = "THB"
)

// IsSupportedCurrency returns true if the currency is supported
func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, THB:
		return true
	}

	return false
}
