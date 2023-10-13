describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should add product to cart", () => {
    cy.get(".products article button").first().click();
    cy.get(".navbar .cart-count").should("have.text", "1");
  });
  
});