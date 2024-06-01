
class TPricingCalculator {
  
/// --- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    
    double shippingCost = getShippingCost(location);
    
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  } 
  
  /// --- Calculate shipping cost
  static String  calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }
  /// --- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double totalAmount = productPrice * taxRate;
    return totalAmount.toStringAsFixed(2);
}

static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API
    // return the appropriate tax rate
    return 0.10;
}
static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location from a tax rate database or API
    // Calculate the shipping cost based on various factors like distance, model etc.
  return 5.00;
}

}