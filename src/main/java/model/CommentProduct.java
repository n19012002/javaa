package model;

import java.sql.Timestamp;

public class CommentProduct {
    private int id;
    private int productId;
    private String authorName;
    private String content;
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

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

	@Override
	public String toString() {
		return "CommentProduct [id=" + id + ", productId=" + productId + ", authorName=" + authorName + ", content="
				+ content + ", createdAt=" + createdAt + "]";
	}
}