const puppeteer = require('puppeteer');

function delay(time) {
    return new Promise(function(resolve) {
        setTimeout(resolve, time)
    });
}

(async () => {
    const browser = await puppeteer.launch({
        headless: false
    });
    const page = await browser.newPage();
    await page.setViewport({width: 1024, height: 1000});

    await page.goto('http://localhost:8083',{ waitUntil: 'networkidle2' });
    console.log('Page http://localhost:8083 loading... ')
    await page.screenshot({ path: '1-nexus-start-page.png' });
    console.log('Page http://localhost:8083 loaded')
    await delay(2000)

    console.log('Clicking link sign in')
    await page.click('#nx-header-signin-1145-btnInnerEl')
    await page.screenshot({ path: '2-after-login-click.png' });
    console.log('Clicking link sign in done')
    await delay(3000)

    console.log('Attempt to close browser...')
    await browser.close();
    console.log('Browser closed')
})();