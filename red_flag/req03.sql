DELETE FROM  epix_posts AS post
USING
    epix_accounts AS account,
    epix_hashtags AS hashtag,
    people AS people
WHERE
    post.author_id = account.id AND
    post.hashtag_id = hashtag.id AND
    account.person_id = people.id AND
    hashtag.name = 'EndSurveillance'
RETURNING
    people.first_name,
    people.last_name,
    account.username,
    post.body post_content;
