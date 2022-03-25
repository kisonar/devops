const puppeteer = require('puppeteer');

const delay = require('./delay');

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
    await page.screenshot({ path: '2-after-sing-in-click.png' });
    console.log('Clicking link sign in done')
    await delay(3000)

    await page.type('#textfield-1171-inputEl', 'admin', { delay: 200});
    await page.type('#textfield-1172-inputEl', 'Mandingo82',{ delay: 200});
    await delay(3000)
    await page.click('#button-1174-btnInnerEl');

    await delay(10000)
    await page.screenshot({ path: '3-after-attempt-to-log-in.png' });

    console.log('Attempt to close browser...')
    await browser.close();
    console.log('Browser closed')
})();