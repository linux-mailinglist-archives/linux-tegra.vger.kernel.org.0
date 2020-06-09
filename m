Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F571F31DA
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jun 2020 03:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgFIBSw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 8 Jun 2020 21:18:52 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:50557 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726860AbgFIBSr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Jun 2020 21:18:47 -0400
X-UUID: 7d208eea7d584f089cb7031acb4386ac-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Sr4Ct7YRr6GdU1Hh9QPu1XqrlaBQaeLAksq4fKW7jgc=;
        b=aCJIlyCIJej0iT+uabiHuuzIFxW5m666tRIrD2EB6U50Db8va4dIDY8CiLFwPiGo6PRe3PS3xXK+6dvTNgDpsUo/bVFxy91vf5pPseBv08Hvl70njRjBg0Ru2j8z5M9f8JQJRHxrArKSy8NHcljtN1SHkOyCV3f+FVPSIV4xD6o=;
X-UUID: 7d208eea7d584f089cb7031acb4386ac-20200609
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1704837095; Tue, 09 Jun 2020 09:18:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 09:18:34 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Jun 2020 09:18:34 +0800
From:   Chun-Hung Wu <chun-hung.wu@mediatek.com>
To:     <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v6 3/4] mmc: mediatek: command queue support
Date:   Tue, 9 Jun 2020 09:18:21 +0800
Message-ID: <1591665502-6573-4-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 75F9262C836C92A565B070B6470D6B95F206D05E1518A5724969ACA8D25EFAB32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

U3VwcG9ydCBjb21tYW5kIHF1ZXVlIGZvciBtdDY3NzkgcGxhdGZvcm0uDQphLiBBZGQgbXNkY19z
ZXRfYnVzeV90aW1lb3V0KCkgdG8gY2FsY3VsYXRlIGVtbWMgd3JpdGUgdGltZW91dC4NCmIuIENv
bm5lY3QgbXRrIG1zZGMgZHJpdmVyIHRvIGNxaGNpIGRyaXZlciB0aHJvdWdoDQogICBob3N0LT5j
cV9ob3N0LT5vcHMgPSAmbXNkY19jbWRxX29wczsNCmMuIG1zZGNfY21kcV9pcnEoKSB3aWxsIGxp
bmsgdXAgd2l0aCBjcWNoaV9pcnEoKS4gQmVzaWRlcywgaXQgcHJvdmlkZXMNCiAgIG1vcmUgaXJx
IGVycm9yIG1lc3NhZ2VzIGxpa2UgUlNQQ1JDRVJSL0NNRFRPL0RBVEFDUkNFUlIvREFUVE1PLg0K
ZC4gVXNlIHRoZSBvcHRpb25zIGJlbG93IHRvIHNlcGFyYXRlIHN1cHBvcnQgZm9yIENRSENJIG9y
IG5vdCwgYmVjYXVzZQ0KICAgc29tZSBvZiBvdXIgcGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCBD
UUhDSSBoZW5jZSBubyBrZXJuZWwgb3B0aW9uOg0KICAgQ09ORklHX01NQ19DUUhDSS4NCiAgICNp
ZiBJU19FTkFCTEVEKENPTkZJR19NTUNfQ1FIQ0kpDQogICBYWFggLy9TdXBwb3J0IENRSENJDQog
ICAjZWxzZQ0KICAgWFhYIC8vTm90IHN1cHBvcnQgQ1FIQ0kNCiAgICNlbmRpZg0KDQpTaWduZWQt
b2ZmLWJ5OiBDaHVuLUh1bmcgV3UgPGNodW4taHVuZy53dUBtZWRpYXRlay5jb20+DQotLS0NCiBk
cml2ZXJzL21tYy9ob3N0L210ay1zZC5jIHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKykN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMgYi9kcml2ZXJzL21tYy9o
b3N0L210ay1zZC5jDQppbmRleCA4NGE3YmQ0NC4uOWQ2OTI2OSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMNCisrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMNCkBA
IC0zMSw2ICszMSw4IEBADQogI2luY2x1ZGUgPGxpbnV4L21tYy9zZGlvLmg+DQogI2luY2x1ZGUg
PGxpbnV4L21tYy9zbG90LWdwaW8uaD4NCiANCisjaW5jbHVkZSAiY3FoY2kuaCINCisNCiAjZGVm
aW5lIE1BWF9CRF9OVU0gICAgICAgICAgMTAyNA0KIA0KIC8qLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLw0K
QEAgLTE1Miw2ICsxNTQsNyBAQA0KICNkZWZpbmUgTVNEQ19JTlRfRE1BX0JEQ1NFUlIgICAgKDB4
MSA8PCAxNykJLyogVzFDICovDQogI2RlZmluZSBNU0RDX0lOVF9ETUFfR1BEQ1NFUlIgICAoMHgx
IDw8IDE4KQkvKiBXMUMgKi8NCiAjZGVmaW5lIE1TRENfSU5UX0RNQV9QUk9URUNUICAgICgweDEg
PDwgMTkpCS8qIFcxQyAqLw0KKyNkZWZpbmUgTVNEQ19JTlRfQ01EUSAgICAgICAgICAgKDB4MSA8
PCAyOCkJLyogVzFDICovDQogDQogLyogTVNEQ19JTlRFTiBtYXNrICovDQogI2RlZmluZSBNU0RD
X0lOVEVOX01NQ0lSUSAgICAgICAoMHgxIDw8IDApCS8qIFJXICovDQpAQCAtMTgyLDYgKzE4NSw3
IEBADQogLyogU0RDX0NGRyBtYXNrICovDQogI2RlZmluZSBTRENfQ0ZHX1NESU9JTlRXS1VQICAg
ICAoMHgxIDw8IDApCS8qIFJXICovDQogI2RlZmluZSBTRENfQ0ZHX0lOU1dLVVAgICAgICAgICAo
MHgxIDw8IDEpCS8qIFJXICovDQorI2RlZmluZSBTRENfQ0ZHX1dSRFRPQyAgICAgICAgICAoMHgx
ZmZmICA8PCAyKSAgLyogUlcgKi8NCiAjZGVmaW5lIFNEQ19DRkdfQlVTV0lEVEggICAgICAgICgw
eDMgPDwgMTYpCS8qIFJXICovDQogI2RlZmluZSBTRENfQ0ZHX1NESU8gICAgICAgICAgICAoMHgx
IDw8IDE5KQkvKiBSVyAqLw0KICNkZWZpbmUgU0RDX0NGR19TRElPSURFICAgICAgICAgKDB4MSA8
PCAyMCkJLyogUlcgKi8NCkBAIC0yMzAsNiArMjM0LDcgQEANCiAjZGVmaW5lIE1TRENfUEFUQ0hf
QklUX0RFQ1JDVE1PICAgKDB4MSA8PCAzMCkJLyogUlcgKi8NCiANCiAjZGVmaW5lIE1TRENfUEFU
Q0hfQklUMV9DTURUQSAgICAgKDB4NyA8PCAzKSAgICAvKiBSVyAqLw0KKyNkZWZpbmUgTVNEQ19Q
QjFfQlVTWV9DSEVDS19TRUwgICAoMHgxIDw8IDcpICAgIC8qIFJXICovDQogI2RlZmluZSBNU0RD
X1BBVENIX0JJVDFfU1RPUF9ETFkgICgweGYgPDwgOCkgICAgLyogUlcgKi8NCiANCiAjZGVmaW5l
IE1TRENfUEFUQ0hfQklUMl9DRkdSRVNQICAgKDB4MSA8PCAxNSkgICAvKiBSVyAqLw0KQEAgLTQz
MSw5ICs0MzYsMTEgQEAgc3RydWN0IG1zZGNfaG9zdCB7DQogCQkJCSAvKiBjbWQgcmVzcG9uc2Ug
c2FtcGxlIHNlbGVjdGlvbiBmb3IgSFM0MDAgKi8NCiAJYm9vbCBoczQwMF9tb2RlOwkvKiBjdXJy
ZW50IGVNTUMgd2lsbCBydW4gYXQgaHM0MDAgbW9kZSAqLw0KIAlib29sIGludGVybmFsX2NkOwkv
KiBVc2UgaW50ZXJuYWwgY2FyZC1kZXRlY3QgbG9naWMgKi8NCisJYm9vbCBjcWhjaTsJCS8qIHN1
cHBvcnQgZU1NQyBodyBjbWRxICovDQogCXN0cnVjdCBtc2RjX3NhdmVfcGFyYSBzYXZlX3BhcmE7
IC8qIHVzZWQgd2hlbiBnYXRlIEhDTEsgKi8NCiAJc3RydWN0IG1zZGNfdHVuZV9wYXJhIGRlZl90
dW5lX3BhcmE7IC8qIGRlZmF1bHQgdHVuZSBzZXR0aW5nICovDQogCXN0cnVjdCBtc2RjX3R1bmVf
cGFyYSBzYXZlZF90dW5lX3BhcmE7IC8qIHR1bmUgcmVzdWx0IG9mIENNRDIxL0NNRDE5ICovDQor
CXN0cnVjdCBjcWhjaV9ob3N0ICpjcV9ob3N0Ow0KIH07DQogDQogc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfbW1jX2NvbXBhdGlibGUgbXQ4MTM1X2NvbXBhdCA9IHsNCkBAIC03NjQsNiArNzcxLDE1
IEBAIHN0YXRpYyB2b2lkIG1zZGNfc2V0X3RpbWVvdXQoc3RydWN0IG1zZGNfaG9zdCAqaG9zdCwg
dTY0IG5zLCB1NjQgY2xrcykNCiAJCSAgICAgICh1MzIpKHRpbWVvdXQgPiAyNTUgPyAyNTUgOiB0
aW1lb3V0KSk7DQogfQ0KIA0KK3N0YXRpYyB2b2lkIG1zZGNfc2V0X2J1c3lfdGltZW91dChzdHJ1
Y3QgbXNkY19ob3N0ICpob3N0LCB1NjQgbnMsIHU2NCBjbGtzKQ0KK3sNCisJdTY0IHRpbWVvdXQ7
DQorDQorCXRpbWVvdXQgPSBtc2RjX3RpbWVvdXRfY2FsKGhvc3QsIG5zLCBjbGtzKTsNCisJc2Ry
X3NldF9maWVsZChob3N0LT5iYXNlICsgU0RDX0NGRywgU0RDX0NGR19XUkRUT0MsDQorCQkgICAg
ICAodTMyKSh0aW1lb3V0ID4gODE5MSA/IDgxOTEgOiB0aW1lb3V0KSk7DQorfQ0KKw0KIHN0YXRp
YyB2b2lkIG1zZGNfZ2F0ZV9jbG9jayhzdHJ1Y3QgbXNkY19ob3N0ICpob3N0KQ0KIHsNCiAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPnNyY19jbGtfY2cpOw0KQEAgLTE0ODAsNiArMTQ5Niwz
NiBAQCBzdGF0aWMgdm9pZCBtc2RjX2VuYWJsZV9zZGlvX2lycShzdHJ1Y3QgbW1jX2hvc3QgKm1t
YywgaW50IGVuYikNCiAJCXBtX3J1bnRpbWVfcHV0X25vaWRsZShob3N0LT5kZXYpOw0KIH0NCiAN
CisjaWYgSVNfRU5BQkxFRChDT05GSUdfTU1DX0NRSENJKQ0KK3N0YXRpYyBpcnFyZXR1cm5fdCBt
c2RjX2NtZHFfaXJxKHN0cnVjdCBtc2RjX2hvc3QgKmhvc3QsIHUzMiBpbnRzdHMpDQorew0KKwlp
bnQgY21kX2VyciA9IDAsIGRhdF9lcnIgPSAwOw0KKw0KKwlpZiAoaW50c3RzICYgTVNEQ19JTlRf
UlNQQ1JDRVJSKSB7DQorCQljbWRfZXJyID0gLUVJTFNFUTsNCisJCWRldl9lcnIoaG9zdC0+ZGV2
LCAiJXM6IENNRCBDUkMgRVJSIiwgX19mdW5jX18pOw0KKwl9IGVsc2UgaWYgKGludHN0cyAmIE1T
RENfSU5UX0NNRFRNTykgew0KKwkJY21kX2VyciA9IC1FVElNRURPVVQ7DQorCQlkZXZfZXJyKGhv
c3QtPmRldiwgIiVzOiBDTUQgVElNRU9VVCBFUlIiLCBfX2Z1bmNfXyk7DQorCX0NCisNCisJaWYg
KGludHN0cyAmIE1TRENfSU5UX0RBVENSQ0VSUikgew0KKwkJZGF0X2VyciA9IC1FSUxTRVE7DQor
CQlkZXZfZXJyKGhvc3QtPmRldiwgIiVzOiBEQVRBIENSQyBFUlIiLCBfX2Z1bmNfXyk7DQorCX0g
ZWxzZSBpZiAoaW50c3RzICYgTVNEQ19JTlRfREFUVE1PKSB7DQorCQlkYXRfZXJyID0gLUVUSU1F
RE9VVDsNCisJCWRldl9lcnIoaG9zdC0+ZGV2LCAiJXM6IERBVEEgVElNRU9VVCBFUlIiLCBfX2Z1
bmNfXyk7DQorCX0NCisNCisJaWYgKGNtZF9lcnIgfHwgZGF0X2Vycikgew0KKwkJZGV2X2Vyciho
b3N0LT5kZXYsICJjbWRfZXJyID0gJWQsIGRhdF9lcnIgPSVkLCBpbnRzdHMgPSAweCV4IiwNCisJ
CQljbWRfZXJyLCBkYXRfZXJyLCBpbnRzdHMpOw0KKwl9DQorDQorCXJldHVybiBjcWhjaV9pcnEo
aG9zdC0+bW1jLCAwLCBjbWRfZXJyLCBkYXRfZXJyKTsNCit9DQorI2VuZGlmDQorDQogc3RhdGlj
IGlycXJldHVybl90IG1zZGNfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCiB7DQogCXN0cnVj
dCBtc2RjX2hvc3QgKmhvc3QgPSAoc3RydWN0IG1zZGNfaG9zdCAqKSBkZXZfaWQ7DQpAQCAtMTUx
Niw2ICsxNTYyLDE2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtc2RjX2lycShpbnQgaXJxLCB2b2lk
ICpkZXZfaWQpDQogCQlpZiAoIShldmVudHMgJiAoZXZlbnRfbWFzayAmIH5NU0RDX0lOVF9TRElP
SVJRKSkpDQogCQkJYnJlYWs7DQogDQorI2lmIElTX0VOQUJMRUQoQ09ORklHX01NQ19DUUhDSSkN
CisJCWlmICgoaG9zdC0+bW1jLT5jYXBzMiAmIE1NQ19DQVAyX0NRRSkgJiYNCisJCSAgICAoZXZl
bnRzICYgTVNEQ19JTlRfQ01EUSkpIHsNCisJCQltc2RjX2NtZHFfaXJxKGhvc3QsIGV2ZW50cyk7
DQorCQkJLyogY2xlYXIgaW50ZXJydXB0cyAqLw0KKwkJCXdyaXRlbChldmVudHMsIGhvc3QtPmJh
c2UgKyBNU0RDX0lOVCk7DQorCQkJcmV0dXJuIElSUV9IQU5ETEVEOw0KKwkJfQ0KKyNlbmRpZg0K
Kw0KIAkJaWYgKCFtcnEpIHsNCiAJCQlkZXZfZXJyKGhvc3QtPmRldiwNCiAJCQkJIiVzOiBNUlE9
TlVMTDsgZXZlbnRzPSUwOFg7IGV2ZW50X21hc2s9JTA4WFxuIiwNCkBAIC0yMjAwLDYgKzIyNTYs
MzYgQEAgc3RhdGljIGludCBtc2RjX2dldF9jZChzdHJ1Y3QgbW1jX2hvc3QgKm1tYykNCiAJCXJl
dHVybiAhdmFsOw0KIH0NCiANCitzdGF0aWMgdm9pZCBtc2RjX2NxZV9lbmFibGUoc3RydWN0IG1t
Y19ob3N0ICptbWMpDQorew0KKwlzdHJ1Y3QgbXNkY19ob3N0ICpob3N0ID0gbW1jX3ByaXYobW1j
KTsNCisNCisJLyogZW5hYmxlIGNtZHEgaXJxICovDQorCXdyaXRlbChNU0RDX0lOVF9DTURRLCBo
b3N0LT5iYXNlICsgTVNEQ19JTlRFTik7DQorCS8qIGVuYWJsZSBidXN5IGNoZWNrICovDQorCXNk
cl9zZXRfYml0cyhob3N0LT5iYXNlICsgTVNEQ19QQVRDSF9CSVQxLCBNU0RDX1BCMV9CVVNZX0NI
RUNLX1NFTCk7DQorCS8qIGRlZmF1bHQgd3JpdGUgZGF0YSAvIGJ1c3kgdGltZW91dCAyMHMgKi8N
CisJbXNkY19zZXRfYnVzeV90aW1lb3V0KGhvc3QsIDIwICogMTAwMDAwMDAwMFVMTCwgMCk7DQor
CS8qIGRlZmF1bHQgcmVhZCBkYXRhIHRpbWVvdXQgMXMgKi8NCisJbXNkY19zZXRfdGltZW91dCho
b3N0LCAxMDAwMDAwMDAwVUxMLCAwKTsNCit9DQorDQordm9pZCBtc2RjX2NxZV9kaXNhYmxlKHN0
cnVjdCBtbWNfaG9zdCAqbW1jLCBib29sIHJlY292ZXJ5KQ0KK3sNCisJc3RydWN0IG1zZGNfaG9z
dCAqaG9zdCA9IG1tY19wcml2KG1tYyk7DQorDQorCS8qIGRpc2FibGUgY21kcSBpcnEgKi8NCisJ
c2RyX2Nscl9iaXRzKGhvc3QtPmJhc2UgKyBNU0RDX0lOVEVOLCBNU0RDX0lOVF9DTURRKTsNCisJ
LyogZGlzYWJsZSBidXN5IGNoZWNrICovDQorCXNkcl9jbHJfYml0cyhob3N0LT5iYXNlICsgTVNE
Q19QQVRDSF9CSVQxLCBNU0RDX1BCMV9CVVNZX0NIRUNLX1NFTCk7DQorDQorCWlmIChyZWNvdmVy
eSkgew0KKwkJc2RyX3NldF9maWVsZChob3N0LT5iYXNlICsgTVNEQ19ETUFfQ1RSTCwNCisJCQkg
ICAgICBNU0RDX0RNQV9DVFJMX1NUT1AsIDEpOw0KKwkJbXNkY19yZXNldF9odyhob3N0KTsNCisJ
fQ0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1tY19ob3N0X29wcyBtdF9tc2RjX29wcyA9
IHsNCiAJLnBvc3RfcmVxID0gbXNkY19wb3N0X3JlcSwNCiAJLnByZV9yZXEgPSBtc2RjX3ByZV9y
ZXEsDQpAQCAtMjIxNiw2ICsyMzAyLDExIEBAIHN0YXRpYyBpbnQgbXNkY19nZXRfY2Qoc3RydWN0
IG1tY19ob3N0ICptbWMpDQogCS5od19yZXNldCA9IG1zZGNfaHdfcmVzZXQsDQogfTsNCiANCitz
dGF0aWMgY29uc3Qgc3RydWN0IGNxaGNpX2hvc3Rfb3BzIG1zZGNfY21kcV9vcHMgPSB7DQorCS5l
bmFibGUgICAgICAgICA9IG1zZGNfY3FlX2VuYWJsZSwNCisJLmRpc2FibGUgICAgICAgID0gbXNk
Y19jcWVfZGlzYWJsZSwNCit9Ow0KKw0KIHN0YXRpYyB2b2lkIG1zZGNfb2ZfcHJvcGVydHlfcGFy
c2Uoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCiAJCQkJICAgc3RydWN0IG1zZGNfaG9z
dCAqaG9zdCkNCiB7DQpAQCAtMjIzNiw2ICsyMzI3LDEyIEBAIHN0YXRpYyB2b2lkIG1zZGNfb2Zf
cHJvcGVydHlfcGFyc2Uoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCiAJCWhvc3QtPmhz
NDAwX2NtZF9yZXNwX3NlbF9yaXNpbmcgPSB0cnVlOw0KIAllbHNlDQogCQlob3N0LT5oczQwMF9j
bWRfcmVzcF9zZWxfcmlzaW5nID0gZmFsc2U7DQorDQorCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jv
b2wocGRldi0+ZGV2Lm9mX25vZGUsDQorCQkJCSAgIm1lZGlhdGVrLGNxaGNpIikpDQorCQlob3N0
LT5jcWhjaSA9IHRydWU7DQorCWVsc2UNCisJCWhvc3QtPmNxaGNpID0gZmFsc2U7DQogfQ0KIA0K
IHN0YXRpYyBpbnQgbXNkY19kcnZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
CkBAIC0yMzUxLDYgKzI0NDgsOCBAQCBzdGF0aWMgaW50IG1zZGNfZHJ2X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCQltbWMtPmNhcHMyIHw9IE1NQ19DQVAyX1NESU9fSVJR
X05PVEhSRUFEOw0KIA0KIAltbWMtPmNhcHMgfD0gTU1DX0NBUF9FUkFTRSB8IE1NQ19DQVBfQ01E
MjM7DQorCWlmIChob3N0LT5jcWhjaSkNCisJCW1tYy0+Y2FwczIgfD0gTU1DX0NBUDJfQ1FFIHwg
TU1DX0NBUDJfQ1FFX0RDTUQ7DQogCS8qIE1NQyBjb3JlIHRyYW5zZmVyIHNpemVzIHR1bmFibGUg
cGFyYW1ldGVycyAqLw0KIAltbWMtPm1heF9zZWdzID0gTUFYX0JEX05VTTsNCiAJaWYgKGhvc3Qt
PmRldl9jb21wLT5zdXBwb3J0XzY0ZykNCkBAIC0yMzY2LDYgKzI0NjUsMjYgQEAgc3RhdGljIGlu
dCBtc2RjX2Rydl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJaG9zdC0+
ZG1hX21hc2sgPSBETUFfQklUX01BU0soMzIpOw0KIAltbWNfZGV2KG1tYyktPmRtYV9tYXNrID0g
Jmhvc3QtPmRtYV9tYXNrOw0KIA0KKyNpZiBJU19FTkFCTEVEKENPTkZJR19NTUNfQ1FIQ0kpDQor
CWlmIChtbWMtPmNhcHMyICYgTU1DX0NBUDJfQ1FFKSB7DQorCQlob3N0LT5jcV9ob3N0ID0gZGV2
bV9remFsbG9jKGhvc3QtPm1tYy0+cGFyZW50LA0KKwkJCQkJICAgICBzaXplb2YoKmhvc3QtPmNx
X2hvc3QpLA0KKwkJCQkJICAgICBHRlBfS0VSTkVMKTsNCisJCWlmICghaG9zdC0+Y3FfaG9zdCkg
ew0KKwkJCXJldCA9IC1FTk9NRU07DQorCQkJZ290byBob3N0X2ZyZWU7DQorCQl9DQorCQlob3N0
LT5jcV9ob3N0LT5jYXBzIHw9IENRSENJX1RBU0tfREVTQ19TWl8xMjg7DQorCQlob3N0LT5jcV9o
b3N0LT5tbWlvID0gaG9zdC0+YmFzZSArIDB4ODAwOw0KKwkJaG9zdC0+Y3FfaG9zdC0+b3BzID0g
Jm1zZGNfY21kcV9vcHM7DQorCQljcWhjaV9pbml0KGhvc3QtPmNxX2hvc3QsIG1tYywgdHJ1ZSk7
DQorCQltbWMtPm1heF9zZWdzID0gMTI4Ow0KKwkJLyogY3FoY2kgMTZiaXQgbGVuZ3RoICovDQor
CQkvKiAwIHNpemUsIG1lYW5zIDY1NTM2IHNvIHdlIGRvbid0IGhhdmUgdG8gLTEgaGVyZSAqLw0K
KwkJbW1jLT5tYXhfc2VnX3NpemUgPSA2NCAqIDEwMjQ7DQorCX0NCisjZW5kaWYNCisNCiAJaG9z
dC0+dGltZW91dF9jbGtzID0gMyAqIDEwNDg1NzY7DQogCWhvc3QtPmRtYS5ncGQgPSBkbWFfYWxs
b2NfY29oZXJlbnQoJnBkZXYtPmRldiwNCiAJCQkJMiAqIHNpemVvZihzdHJ1Y3QgbXRfZ3BkbWFf
ZGVzYyksDQotLSANCjEuOS4xDQo=

