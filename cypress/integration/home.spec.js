describe("Home Page", () => {
  
  it("home page should be visited", () => {
      cy.visit("/");
    });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
});