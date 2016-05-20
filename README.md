# snowblog

Blog engine for [Snowdrift](https:///snowdrift.coop). This software is
written in [Haskell](https://www.haskell.org/), and licensed under the
[GNU AGPL](https://www.gnu.org/licenses/agpl-3.0.txt), a copy of which
can be found in the [LICENSE](LICENSE) file.

## Building this on your own machine

First, install [stack](http://docs.haskellstack.org/en/stable/README/)
and
[PostgreSQL](https://wiki.postgresql.org/wiki/Detailed_installation_guides).

    $ git clone https://git.snowdrift.coop/pharpend/snowblog.git
    $ cd snowblog
    $ stack setup
    $ stack build
    $ ./sdb.hs devel

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

*   Routes. Here are the non-degenenerate routes (i.e. not `/favicon.ico`
    et al)

        / HomeR GET
        /notifications NotificationsR GET

        /new/comment NewCommentR  GET POST
        /new/page    NewStaticPageR  GET POST
        /new/post    NewPostR  GET POST
        /new/user    NewUserR  GET POST

        /comment/#CommentId      CommentR     GET
        /comment/#CommentId/del  CommentDelR  GET POST
        /comment/#CommentId/edit CommentEditR GET POST

        /page/#Text      StaticPageR     GET
        /page/#Text/del  StaticPageDelR  GET POST
        /page/#Text/edit StaticPageEditR GET POST

        /post/#Text      PostR     GET
        /post/#Text/del  PostDelR  GET POST
        /post/#Text/edit PostEditR GET POST

        /user/#Text      UserR     GET
        /user/#Text/del  UserDelR  GET POST
        /user/#Text/edit UserEditR GET POST


*   Models

        Comment json
            author UserId
            text Markdown
            created UTCTime
            comments [CommentId]

        Notification json
            target UserId
            text Text
            read Bool
            created UTCTime

        Post json
            slug Text
            title Text
            authors [UserId]
            text Markdown
            created UTCTime
            comments [CommentId]
            UniquePost slug

        StaticPage json
            slug Text
            title Text
            authors [UserId]
            text Markdown
            created UTCTime
            comments [CommentId]
            UniquePage slug

        User
            ident Text
            email Text Maybe
            emailVerified Bool
            emailVerkey Text
            realName Text Maybe
            password Text Maybe
            role Role
            created UTCTime
            UniqueUser ident

    A note on `Role`. It's defined in
    [`src/Model/Role.hs`](src/Model/Role.hs) as
    
    ```haskell
    data Role = Admin
              | Moderator
              | Contributor
              | Established
    ```
    
    It's an instance of `PersistField` and `PersistFieldSql`, so it can
    be a field in the database. Each role is a superset of the next
    role. That is,
    
    + All `Admin`s are `Moderator`s
    + All `Moderator`s are `Contributor`s
    + All `Contributor`s are `Established`
