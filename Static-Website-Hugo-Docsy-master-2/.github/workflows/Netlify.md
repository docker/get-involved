    - name: Build for Netlify
      run: |
       rm -rf ./public
       hugo --gc --minify -b ${{ secrets.NETLIFY_SITE_URL }}
       
    - name: Deploy to Netlify
      uses: nwtgck/actions-netlify@v1.1
      with:
          publish-dir: './public'
          production-branch: master
          github-token: ${{ secrets.GITHUB_TOKEN }}
          deploy-message: "Deploy from GitHub Actions"
          enable-pull-request-comment: false
          enable-commit-comment: true
          overwrites-pull-request-comment: true
      env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
      timeout-minutes: 1
