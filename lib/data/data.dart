const List<ProductItem> data = [
  ProductItem(
      id: 1,
      imageURL:
          'https://images-na.ssl-images-amazon.com/images/I/81pzsRpE5GL._SL1500_.jpg',
      name: 'Redmi Note 9 Pro',
      price: '12,999.00'),
  ProductItem(
      id: 2,
      imageURL:
          'https://images-na.ssl-images-amazon.com/images/I/81TxKxCDFZL._SL1500_.jpg',
      name: 'Samsung Galaxy M31 Prime',
      price: '16,499.00'),
  ProductItem(
      id: 3,
      imageURL:
          'https://images-na.ssl-images-amazon.com/images/I/71XXJC7V8tL._SL1500_.jpg',
      name: 'New Apple iPhone 12 Pro Max',
      price: '1,39,900.00'),
];

class ProductItem {
  final int id;
  final String imageURL;
  final String name;
  final String price;
  const ProductItem({this.id, this.name, this.imageURL, this.price});
}
