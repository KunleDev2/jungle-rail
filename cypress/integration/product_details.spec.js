describe("Product Details Page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to product details page", () => {
    cy.get(".products article a").first().click();
    cy.url().should("include", "/views/products/");
    cy.get(".product-detail").should("be.visible");
  });
});