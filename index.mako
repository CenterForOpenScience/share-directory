<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>SHARE Curation Associates Directory</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
          @import 'https://fonts.googleapis.com/css?family=Cousine:400,700';
            body{
              font-family:
            'Cousine',Menlo,Consolas,monospace;
            font-size:14px;
            line-height:22px;
            color:  #aaa;
            padding:10px;
              margin:0 0 0 200px;
            word-wrap:break-word;
            -webkit-text-size-adjust:none;
            }

            h1{
              font-size:inherit;
              font-weight: normal;
              color: black;
            }

            h1,p{
              display:inline;
              color:black;
            }

            h1,a{
              border-bottom:4px solid black;
              padding:6px 0 2px;

            }
            a {
              color: #38E;
              text-decoration:none;
              border-color: #38E;
            }
            a:hover{
              background:black;
            }

            .br{
              word-spacing:-5px;
            }

            .lk:link,.lk:visited{
              color: #aaa;
              border-color: transparent;
            }

            .lk:hover{
              border-color:#aaa;
            }

            /* */

            .header-links {
              padding-top: 15px;
            }

            .links {
              font-size: 0.8em;
            }

            h1,h2,h3,p {
              display:table;
              padding:0;
            }

            h1{
              border-bottom:none;
              margin:0;
            }
            section{
            margin:0 0 2em;
            }
            h2,h3
            {
            font-size:inherit;
            font-weight:normal;
            color:black;
            border-bottom:1px solid black;
            }

            h2{
              border-bottom-width:4px;
            }
            h2,h3,p{
              margin:0 0 1em;
            }
            header{
              position:absolute;margin:0 0 0 -200px;
            }

            @media screen and (max-width:700px){body{margin:0;}header{position:static;margin:0 0 2em;}}

            .entries {
              padding-left: 80px;
            }

            .entries a {
              border-bottom: none;
            }
        </style>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <header>
        <h1>SHARE Directory</h1>
        <div class="header-links">
          <p><a href="https://github.com/CenterForOpenScience/SHARE">SHARE @ GitHub</a></p>
          <p><a href="https://github.com/CenterForOpenScience/share-directory">Add yourself</a></p>
        </div>
        </header>

        <div class="entries">
          % if associates:
          <section>
            <h2>Associates</h2>
            % for datum in associates:
              ${render_entry(datum)}
            % endfor
          </section>
          % endif

          % if developers:
          <section>
            <h2>Developers</h2>
            % for datum in developers:
              ${render_entry(datum)}
            % endfor
          </section>
          % endif
        </div>

        <a href="https://github.com/CenterForOpenScience/share-directory" class="github-corner"><svg width="80" height="80" viewBox="0 0 250 250" style="fill:#38E; color:#fff; position: absolute; top: 0; border: 0; right: 0;"><path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path><path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"></path><path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"></path></svg></a><style>.github-corner:hover .octo-arm{animation:octocat-wave 560ms ease-in-out}@keyframes octocat-wave{0%,100%{transform:rotate(0)}20%,60%{transform:rotate(-25deg)}40%,80%{transform:rotate(10deg)}}@media (max-width:500px){.github-corner:hover .octo-arm{animation:none}.github-corner .octo-arm{animation:octocat-wave 560ms ease-in-out}}</style>
    </body>
</html>


<%def name="render_entry(data)">
  <div>
    <h3 style="display: inline;"><strong>${data['last']}, ${data['first']}</strong></h3>
    <span class="links">
    % if data.get('personal'):
    |
      <span><a href="${data['personal']}">Website</a></span>
    % endif

    % if data.get('email'):
    |
      <span><a href="mailto:${data['email']}">Email</a></span>
    % endif

    % if data.get('twitter'):
    |
      <span><a href="https://twitter.com/${data['twitter']}/">Twitter</a></span>
    % endif

    % if data.get('github'):
    |
      <span><a href="https://github.com/${data['github']}/">GitHub</a></span>
    % endif

    % if data.get('osf'):
    |
      <span><a href="https://osf.io/${data['osf']}/">OSF</a></span>
    % endif
    </span>
  </div>
</%def>
