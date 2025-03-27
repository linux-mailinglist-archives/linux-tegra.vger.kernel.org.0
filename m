Return-Path: <linux-tegra+bounces-5711-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB9A73262
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Mar 2025 13:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250FF1896FD9
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Mar 2025 12:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B025B214235;
	Thu, 27 Mar 2025 12:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="M+vprhAO"
X-Original-To: linux-tegra@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE55C1AF0C1
	for <linux-tegra@vger.kernel.org>; Thu, 27 Mar 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079216; cv=none; b=DNVgsIP3HV4fPurV2S/aIRxDcEW8k1NIIpRcrhsZVb8R+CpnOsMiaN8KuCf4a4b2wEK4rDw4Qh0pIfwDbFncUeYI7EYVM4lx+QlRT4L4pGMAvN8EVev0T7gRBJE485r648MDMKy/ZMxpIoS70ix31VriXaNb8ppsXS3drPC5KnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079216; c=relaxed/simple;
	bh=YbkUip2l2LrIQ1eEfSNG00WINt8KdOeszFX6vxWM53c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=aJw6J0HR83GGXn9K5ARwgpNAPll0a5Xddrb5QwIyFkx/K5M9hYiB4R9O+6soW37rt9yqgMliWhhHfKY1FQUkZQ9RjaQ1FLLk2z2g/SCACqUoG2l0mgGKDOlQJ/i2PzfIfCuZmeUpWRUXCCbUIqMi8S9ycSWaGLhiU34gXp0JDl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=M+vprhAO reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/T62cBBd0pDjBtvy1ZY090Q2whzh7b/Qe+q6nLlyZKA=; b=M
	+vprhAOZ6Y7Ao54I7WlIa8WFFNs198QIv+rL6J78N/4GR06qp6FjWaYtGjkgvS7m
	VDHhr5SriQAJZgmT6foqM8cT8PeuknOwsllGdkH+6aWyLtUZpCvDS8/zJ2D8dlUz
	9B0ICnGYJT5EzjPkkCZXb4kuRCUcXBxvAvQA+TMUWk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-115 (Coremail) ; Thu, 27 Mar 2025 20:39:02 +0800
 (CST)
Date: Thu, 27 Mar 2025 20:39:02 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re:[PATCH v2 1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra
 to common drm_dp_helper
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
X-NTES-SC: AL_Qu2fAfyctkkv5CKdbekfmkcVgOw9UcO5v/Qk3oZXOJF8jDzp/xADZW1jPVTtweeEIS+ujTi3dDVRxcBmeZlRU6Ugl2BHLaPoVMD7DZlp7dcIaA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <76a55b32.acc9.195d79cf378.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cygvCgD338bmRuVnGa+OAA--.62833W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gEdXmflRdEM6AACsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIERtaXRyeSwKICAgICBDb3VsZCB5b3UgdGFrZSB0aGlzIHNlcmllcz8gSWYgc28sIG1l
cmdpbmcgaXQgZWFybGllciBjYW4gYXZvaWQgZnV0dXJlIGNvbmZsaWN0cyBmcm9tIG90aGVyIHBh
dGNoZXMuIApCZXNpZGVzLCBJIGNhbiB1cGRhdGUgbXkgRFAgZHJpdmVyIGJhc2VkIG9uIGRybS1t
aXNjLW5leHQuCgpBdCAyMDI1LTAzLTE4IDE0OjM0OjM1LCAiQW5keSBZYW4iIDxhbmR5c2hya0Ax
NjMuY29tPiB3cm90ZToKPkZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4K
Pgo+VGhlIGhlbHBlciBmdW5jdGlvbnMgZHJtX2RwX2xpbmtfcG93ZXJfdXAvZG93biB3ZXJlIG1v
dmVkIHRvIFRlZ3JhCj5EUk0gaW4gY29tbWl0IDlhNDJjN2M2NDdhOSAoImRybS90ZWdyYTogTW92
ZSBkcm1fZHBfbGluayBoZWxwZXJzIHRvIFRlZ3JhIERSTSIpIi4KPgo+Tm93IHNpbmNlIG1vcmUg
YW5kIG1vcmUgdXNlcnMgYXJlIGR1cGxpY2F0aW5nIHRoZSBzYW1lIGNvZGUgaW4gdGhlaXIKPm93
biBkcml2ZXJzLCBpdCdzIHRpbWUgdG8gbWFrZSB0aGVtIGFzIERSTSBEUCBjb21tb24gaGVscGVy
cyBhZ2Fpbi4KPgo+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMu
Y29tPgo+QWNrZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1
YWxjb21tLmNvbT4KPi0tLQo+Cj5DaGFuZ2VzIGluIHYyOgo+LSBGaXggY29tbWl0IG1lc3NhZ2Ug
YXMgc3VnZ2VzdGVkIGJ5IERtaXRyeQo+Cj4gZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2Rw
X2hlbHBlci5jIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKwo+IGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcC5jICAgICAgICAgICAgICB8IDY3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oICAgICAgICAgICAgICB8ICAyIC0KPiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvc29yLmMgICAgICAgICAgICAgfCAgNCArLQo+IGluY2x1ZGUvZHJtL2Rp
c3BsYXkvZHJtX2RwX2hlbHBlci5oICAgICB8ICAyICsKPiA1IGZpbGVzIGNoYW5nZWQsIDczIGlu
c2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJt
X2RwX2hlbHBlci5jCj5pbmRleCBkYmNlMWMzZjQ5NjkuLmU1ZGVjNjdlNWZjYSAxMDA2NDQKPi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYwo+KysrIGIvZHJpdmVy
cy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jCj5AQCAtODM4LDYgKzgzOCw3NSBAQCBp
bnQgZHJtX2RwX2RwY2RfcmVhZF9waHlfbGlua19zdGF0dXMoc3RydWN0IGRybV9kcF9hdXggKmF1
eCwKPiB9Cj4gRVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkX3BoeV9saW5rX3N0YXR1cyk7
Cj4gCj4rLyoqCj4rICogZHJtX2RwX2xpbmtfcG93ZXJfdXAoKSAtIHBvd2VyIHVwIGEgRGlzcGxh
eVBvcnQgbGluawo+KyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCj4rICogQHJldmlz
aW9uOiBEUENEIHJldmlzaW9uIHN1cHBvcnRlZCBvbiB0aGUgbGluawo+KyAqCj4rICogUmV0dXJu
cyAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4rICov
Cj4raW50IGRybV9kcF9saW5rX3Bvd2VyX3VwKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHVuc2ln
bmVkIGNoYXIgcmV2aXNpb24pCj4rewo+Kwl1OCB2YWx1ZTsKPisJaW50IGVycjsKPisKPisJLyog
RFBfU0VUX1BPV0VSIHJlZ2lzdGVyIGlzIG9ubHkgYXZhaWxhYmxlIG9uIERQQ0QgdjEuMSBhbmQg
bGF0ZXIgKi8KPisJaWYgKHJldmlzaW9uIDwgRFBfRFBDRF9SRVZfMTEpCj4rCQlyZXR1cm4gMDsK
PisKPisJZXJyID0gZHJtX2RwX2RwY2RfcmVhZGIoYXV4LCBEUF9TRVRfUE9XRVIsICZ2YWx1ZSk7
Cj4rCWlmIChlcnIgPCAwKQo+KwkJcmV0dXJuIGVycjsKPisKPisJdmFsdWUgJj0gfkRQX1NFVF9Q
T1dFUl9NQVNLOwo+Kwl2YWx1ZSB8PSBEUF9TRVRfUE9XRVJfRDA7Cj4rCj4rCWVyciA9IGRybV9k
cF9kcGNkX3dyaXRlYihhdXgsIERQX1NFVF9QT1dFUiwgdmFsdWUpOwo+KwlpZiAoZXJyIDwgMCkK
PisJCXJldHVybiBlcnI7Cj4rCj4rCS8qCj4rCSAqIEFjY29yZGluZyB0byB0aGUgRFAgMS4xIHNw
ZWNpZmljYXRpb24sIGEgIlNpbmsgRGV2aWNlIG11c3QgZXhpdCB0aGUKPisJICogcG93ZXIgc2F2
aW5nIHN0YXRlIHdpdGhpbiAxIG1zIiAoU2VjdGlvbiAyLjUuMy4xLCBUYWJsZSA1LTUyLCAiU2lu
awo+KwkgKiBDb250cm9sIEZpZWxkIiAocmVnaXN0ZXIgMHg2MDApLgo+KwkgKi8KPisJdXNsZWVw
X3JhbmdlKDEwMDAsIDIwMDApOwo+Kwo+KwlyZXR1cm4gMDsKPit9Cj4rRVhQT1JUX1NZTUJPTChk
cm1fZHBfbGlua19wb3dlcl91cCk7Cj4rCj4rLyoqCj4rICogZHJtX2RwX2xpbmtfcG93ZXJfZG93
bigpIC0gcG93ZXIgZG93biBhIERpc3BsYXlQb3J0IGxpbmsKPisgKiBAYXV4OiBEaXNwbGF5UG9y
dCBBVVggY2hhbm5lbAo+KyAqIEByZXZpc2lvbjogRFBDRCByZXZpc2lvbiBzdXBwb3J0ZWQgb24g
dGhlIGxpbmsKPisgKgo+KyAqIFJldHVybnMgMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJy
b3IgY29kZSBvbiBmYWlsdXJlLgo+KyAqLwo+K2ludCBkcm1fZHBfbGlua19wb3dlcl9kb3duKHN0
cnVjdCBkcm1fZHBfYXV4ICphdXgsIHVuc2lnbmVkIGNoYXIgcmV2aXNpb24pCj4rewo+Kwl1OCB2
YWx1ZTsKPisJaW50IGVycjsKPisKPisJLyogRFBfU0VUX1BPV0VSIHJlZ2lzdGVyIGlzIG9ubHkg
YXZhaWxhYmxlIG9uIERQQ0QgdjEuMSBhbmQgbGF0ZXIgKi8KPisJaWYgKHJldmlzaW9uIDwgRFBf
RFBDRF9SRVZfMTEpCj4rCQlyZXR1cm4gMDsKPisKPisJZXJyID0gZHJtX2RwX2RwY2RfcmVhZGIo
YXV4LCBEUF9TRVRfUE9XRVIsICZ2YWx1ZSk7Cj4rCWlmIChlcnIgPCAwKQo+KwkJcmV0dXJuIGVy
cjsKPisKPisJdmFsdWUgJj0gfkRQX1NFVF9QT1dFUl9NQVNLOwo+Kwl2YWx1ZSB8PSBEUF9TRVRf
UE9XRVJfRDM7Cj4rCj4rCWVyciA9IGRybV9kcF9kcGNkX3dyaXRlYihhdXgsIERQX1NFVF9QT1dF
UiwgdmFsdWUpOwo+KwlpZiAoZXJyIDwgMCkKPisJCXJldHVybiBlcnI7Cj4rCj4rCXJldHVybiAw
Owo+K30KPitFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3Bvd2VyX2Rvd24pOwo+Kwo+IHN0YXRp
YyBpbnQgcmVhZF9wYXlsb2FkX3VwZGF0ZV9zdGF0dXMoc3RydWN0IGRybV9kcF9hdXggKmF1eCkK
PiB7Cj4gCWludCByZXQ7Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwo+aW5kZXggMDhmYmQ4ZjE1MWExLi45OTBlNzQ0
YjA5MjMgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwo+KysrIGIvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKPkBAIC0yNTUsNzMgKzI1NSw2IEBAIGludCBkcm1fZHBf
bGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxp
bmspCj4gCXJldHVybiAwOwo+IH0KPiAKPi0vKioKPi0gKiBkcm1fZHBfbGlua19wb3dlcl91cCgp
IC0gcG93ZXIgdXAgYSBEaXNwbGF5UG9ydCBsaW5rCj4tICogQGF1eDogRGlzcGxheVBvcnQgQVVY
IGNoYW5uZWwKPi0gKiBAbGluazogcG9pbnRlciB0byBhIHN0cnVjdHVyZSBjb250YWluaW5nIHRo
ZSBsaW5rIGNvbmZpZ3VyYXRpb24KPi0gKgo+LSAqIFJldHVybnMgMCBvbiBzdWNjZXNzIG9yIGEg
bmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+LSAqLwo+LWludCBkcm1fZHBfbGlua19w
b3dlcl91cChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmsp
Cj4tewo+LQl1OCB2YWx1ZTsKPi0JaW50IGVycjsKPi0KPi0JLyogRFBfU0VUX1BPV0VSIHJlZ2lz
dGVyIGlzIG9ubHkgYXZhaWxhYmxlIG9uIERQQ0QgdjEuMSBhbmQgbGF0ZXIgKi8KPi0JaWYgKGxp
bmstPnJldmlzaW9uIDwgMHgxMSkKPi0JCXJldHVybiAwOwo+LQo+LQllcnIgPSBkcm1fZHBfZHBj
ZF9yZWFkYihhdXgsIERQX1NFVF9QT1dFUiwgJnZhbHVlKTsKPi0JaWYgKGVyciA8IDApCj4tCQly
ZXR1cm4gZXJyOwo+LQo+LQl2YWx1ZSAmPSB+RFBfU0VUX1BPV0VSX01BU0s7Cj4tCXZhbHVlIHw9
IERQX1NFVF9QT1dFUl9EMDsKPi0KPi0JZXJyID0gZHJtX2RwX2RwY2Rfd3JpdGViKGF1eCwgRFBf
U0VUX1BPV0VSLCB2YWx1ZSk7Cj4tCWlmIChlcnIgPCAwKQo+LQkJcmV0dXJuIGVycjsKPi0KPi0J
LyoKPi0JICogQWNjb3JkaW5nIHRvIHRoZSBEUCAxLjEgc3BlY2lmaWNhdGlvbiwgYSAiU2luayBE
ZXZpY2UgbXVzdCBleGl0IHRoZQo+LQkgKiBwb3dlciBzYXZpbmcgc3RhdGUgd2l0aGluIDEgbXMi
IChTZWN0aW9uIDIuNS4zLjEsIFRhYmxlIDUtNTIsICJTaW5rCj4tCSAqIENvbnRyb2wgRmllbGQi
IChyZWdpc3RlciAweDYwMCkuCj4tCSAqLwo+LQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7Cj4t
Cj4tCXJldHVybiAwOwo+LX0KPi0KPi0vKioKPi0gKiBkcm1fZHBfbGlua19wb3dlcl9kb3duKCkg
LSBwb3dlciBkb3duIGEgRGlzcGxheVBvcnQgbGluawo+LSAqIEBhdXg6IERpc3BsYXlQb3J0IEFV
WCBjaGFubmVsCj4tICogQGxpbms6IHBvaW50ZXIgdG8gYSBzdHJ1Y3R1cmUgY29udGFpbmluZyB0
aGUgbGluayBjb25maWd1cmF0aW9uCj4tICoKPi0gKiBSZXR1cm5zIDAgb24gc3VjY2VzcyBvciBh
IG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPi0gKi8KPi1pbnQgZHJtX2RwX2xpbmtf
cG93ZXJfZG93bihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxp
bmspCj4tewo+LQl1OCB2YWx1ZTsKPi0JaW50IGVycjsKPi0KPi0JLyogRFBfU0VUX1BPV0VSIHJl
Z2lzdGVyIGlzIG9ubHkgYXZhaWxhYmxlIG9uIERQQ0QgdjEuMSBhbmQgbGF0ZXIgKi8KPi0JaWYg
KGxpbmstPnJldmlzaW9uIDwgMHgxMSkKPi0JCXJldHVybiAwOwo+LQo+LQllcnIgPSBkcm1fZHBf
ZHBjZF9yZWFkYihhdXgsIERQX1NFVF9QT1dFUiwgJnZhbHVlKTsKPi0JaWYgKGVyciA8IDApCj4t
CQlyZXR1cm4gZXJyOwo+LQo+LQl2YWx1ZSAmPSB+RFBfU0VUX1BPV0VSX01BU0s7Cj4tCXZhbHVl
IHw9IERQX1NFVF9QT1dFUl9EMzsKPi0KPi0JZXJyID0gZHJtX2RwX2RwY2Rfd3JpdGViKGF1eCwg
RFBfU0VUX1BPV0VSLCB2YWx1ZSk7Cj4tCWlmIChlcnIgPCAwKQo+LQkJcmV0dXJuIGVycjsKPi0K
Pi0JcmV0dXJuIDA7Cj4tfQo+LQo+IC8qKgo+ICAqIGRybV9kcF9saW5rX2NvbmZpZ3VyZSgpIC0g
Y29uZmlndXJlIGEgRGlzcGxheVBvcnQgbGluawo+ICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBj
aGFubmVsCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmggYi9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZHAuaAo+aW5kZXggY2IxMmVkMGM1NGU3Li42OTUwNjBjYWZhYzAgMTAw
NjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuaAo+KysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RwLmgKPkBAIC0xNjQsOCArMTY0LDYgQEAgaW50IGRybV9kcF9saW5rX3JlbW92
ZV9yYXRlKHN0cnVjdCBkcm1fZHBfbGluayAqbGluaywgdW5zaWduZWQgbG9uZyByYXRlKTsKPiB2
b2lkIGRybV9kcF9saW5rX3VwZGF0ZV9yYXRlcyhzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspOwo+
IAo+IGludCBkcm1fZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3Qg
ZHJtX2RwX2xpbmsgKmxpbmspOwo+LWludCBkcm1fZHBfbGlua19wb3dlcl91cChzdHJ1Y3QgZHJt
X2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspOwo+LWludCBkcm1fZHBfbGlu
a19wb3dlcl9kb3duKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAq
bGluayk7Cj4gaW50IGRybV9kcF9saW5rX2NvbmZpZ3VyZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4
LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspOwo+IGludCBkcm1fZHBfbGlua19jaG9vc2Uoc3Ry
dWN0IGRybV9kcF9saW5rICpsaW5rLAo+IAkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptb2RlLAo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+aW5kZXggZjk4ZjcwZWRhOTA2Li4yMWYzZGZk
Y2M1YzkgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+QEAgLTI2NjYsNyArMjY2Niw3IEBAIHN0YXRpYyB2
b2lkIHRlZ3JhX3Nvcl9kcF9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAJ
ICogdGhlIEFVWCB0cmFuc2FjdGlvbnMgd291bGQganVzdCBiZSB0aW1pbmcgb3V0Lgo+IAkgKi8K
PiAJaWYgKG91dHB1dC0+Y29ubmVjdG9yLnN0YXR1cyAhPSBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nv
bm5lY3RlZCkgewo+LQkJZXJyID0gZHJtX2RwX2xpbmtfcG93ZXJfZG93bihzb3ItPmF1eCwgJnNv
ci0+bGluayk7Cj4rCQllcnIgPSBkcm1fZHBfbGlua19wb3dlcl9kb3duKHNvci0+YXV4LCBzb3It
PmxpbmsucmV2aXNpb24pOwo+IAkJaWYgKGVyciA8IDApCj4gCQkJZGV2X2Vycihzb3ItPmRldiwg
ImZhaWxlZCB0byBwb3dlciBkb3duIGxpbms6ICVkXG4iLAo+IAkJCQllcnIpOwo+QEAgLTI4ODIs
NyArMjg4Miw3IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX3Nvcl9kcF9lbmFibGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyKQo+IAllbHNlCj4gCQlkZXZfZGJnKHNvci0+ZGV2LCAibGluayB0cmFp
bmluZyBzdWNjZWVkZWRcbiIpOwo+IAo+LQllcnIgPSBkcm1fZHBfbGlua19wb3dlcl91cChzb3It
PmF1eCwgJnNvci0+bGluayk7Cj4rCWVyciA9IGRybV9kcF9saW5rX3Bvd2VyX3VwKHNvci0+YXV4
LCBzb3ItPmxpbmsucmV2aXNpb24pOwo+IAlpZiAoZXJyIDwgMCkKPiAJCWRldl9lcnIoc29yLT5k
ZXYsICJmYWlsZWQgdG8gcG93ZXIgdXAgRFAgbGluazogJWRcbiIsIGVycik7Cj4gCj5kaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcF9oZWxwZXIuaAo+aW5kZXggNWFlNDI0MTk1OWYyLi5mOWRhYmNlNDg0YTcg
MTAwNjQ0Cj4tLS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaAo+KysrIGIv
aW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmgKPkBAIC01NjYsNiArNTY2LDggQEAg
aW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3RydWN0IGRybV9kcF9hdXggKmF1eCwK
PiBpbnQgZHJtX2RwX2RwY2RfcmVhZF9waHlfbGlua19zdGF0dXMoc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwKPiAJCQkJICAgICBlbnVtIGRybV9kcF9waHkgZHBfcGh5LAo+IAkJCQkgICAgIHU4IGxp
bmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdKTsKPitpbnQgZHJtX2RwX2xpbmtfcG93ZXJf
dXAoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgY2hhciByZXZpc2lvbik7Cj4raW50
IGRybV9kcF9saW5rX3Bvd2VyX2Rvd24oc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQg
Y2hhciByZXZpc2lvbik7Cj4gCj4gaW50IGRybV9kcF9kcGNkX3dyaXRlX3BheWxvYWQoc3RydWN0
IGRybV9kcF9hdXggKmF1eCwKPiAJCQkgICAgICBpbnQgdmNwaWQsIHU4IHN0YXJ0X3RpbWVfc2xv
dCwgdTggdGltZV9zbG90X2NvdW50KTsKPi0tIAo+Mi40My4wCg==

