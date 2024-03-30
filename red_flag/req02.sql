UPDATE
    epix_posts
SET
    downvotes = upvotes *
    (
    SELECT
        sum(CAST(downvotes AS float) / CAST(upvotes AS float)) / count(*)
    FROM
        epix_posts
    WHERE
        author_id = 933 AND id != 139
    )
WHERE
    id = 139;
