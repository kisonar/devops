const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({
        headless: false
    });
    const page = await browser.newPage();
    await page.setViewport({width: 1366, height: 768});
    await page.goto('http://localhost:8083',{ waitUntil: 'networkidle2' });
    //await page.screenshot({ path: '1-start.png' });
    await page.click('#nx-header-signin-1145-btnInnerEl')
    //await page.screenshot({ path: '2-after-login-click.png' });

    page.on('dialog', async (dialog) => {
        console.log("Cos tam mamy"+ dialog.message());
        await dialog.dismiss();
        await browser.close();
    });

    await browser.close();
})();