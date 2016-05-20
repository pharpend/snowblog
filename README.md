# snowblog

Blog engine for [Snowdrift](https:///snowdrift.coop). This software is
written in [Haskell](https://www.haskell.org/), and licensed under the
[GNU AGPL](https://www.gnu.org/licenses/agpl-3.0.txt), a copy of which
can be found in the [LICENSE](LICENSE) file.

## Building this on your own machine

First, install [stack](http://docs.haskellstack.org/en/stable/README/)
and
[PostgreSQL](https://wiki.postgresql.org/wiki/Detailed_installation_guides).

    git clone https://git.snowdrift.coop/pharpend/snowblog.git
    cd snowblog
    stack setup
    stack build
    ./sdb.hs devel

Then, visit <http://localhost:3000> on your machine.

The test suite can be run with `./sdb.hs test`.

## Contributing

Anyone is welcome to contribute.

* IRC channel: `#snowdrift` on FreeNode.net
* Bug tracker: <https://git.snowdrift.coop/pharpend/snowblog/issues>
* Mailing lists: <https://lists.snowdrift.coop>

The maintainer is Peter Harpending.

* Email: `peter@harpending.org`
* IRC: `pharpend` on FreeNode.net

## Specification

*   Routes:

    + `HomeR GET` lists all the posts

    + `PostR GET` views a particular post, plus its comments
    + `NewPostR GET POST` makes a new post
    + `PostEditR GET POST` edits an existing post
    + `PostDelR GET POST` blanks a post, leaves plus its comments

    + `NewCommentR POST` adds a new comment to a post
    + `CommentR GET` views a comment tree.
    + `CommentEditR POST` edits a comment
    + `CommentDelR POST` blanks a comment

    + `NewUserR GET POST` Creates a new user
    + `UserR GET` views a user's page
    + `UserDelR GET POST` deletes a user, and blanks its comments
    + `UserEditR GET POST` edits a user's info

    + `NotificationsR GET` views a user's notifications

*   Models

```
User
    ident Text
    email Text Maybe
    emailVerified Bool
    emailVerkey Text
    realName Text Maybe
    passphrase Text Maybe
    created UTCTime
    UniqueUser ident

Page
    slug Text
    title Text
    authors [UserId]
    text Markdown
    created UTCTime
    comments [CommentId]
    UniquePage slug

Post
    slug Text
    title Text
    authors [UserId]
    text Markdown
    created UTCTime
    comments [CommentId]
    UniquePost slug

Comment
    author UserId
    text Markdown
    created UTCTime
    comments [CommentId]

Notification
    user UserId
    text Text
    read Bool
    created UTCTime
```
