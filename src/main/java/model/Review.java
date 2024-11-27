package model;

import java.sql.Timestamp;

public class Review {
    private int id;
    private int productId;
    private int rating;
    private String comment;
    private Timestamp createdAt;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

	@Override
	public String toString() {
		return "Review [id=" + id + ", productId=" + productId + ", rating=" + rating + ", comment=" + comment
				+ ", createdAt=" + createdAt + "]";
	}
}