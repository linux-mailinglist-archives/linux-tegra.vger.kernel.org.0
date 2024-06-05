Return-Path: <linux-tegra+bounces-2572-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0E8FD530
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2024 20:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63CDA1F27524
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2024 18:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8E5152174;
	Wed,  5 Jun 2024 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Idku6B1W"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D514F9FC
	for <linux-tegra@vger.kernel.org>; Wed,  5 Jun 2024 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610584; cv=none; b=Zr6D8O1Pge0AxO6Yr+47jVXmc9siCFdK9C5CsDRPPlvZT9UT2T7I0WyDVEBkilJtgGyUtCN9FexuwGLv21s281z7bJDMwwlBJ5eWD5GEv6MxCbMCbfPfXlk0gxzEVLxsLLZygE15ATzfx7OUQnomg89/JQ34KMa3mj0Y11LjOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610584; c=relaxed/simple;
	bh=5F0WRZAIFyT/53498dR8Vin7Zzzm6LhYVaUBgnMWhtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BN93nv/rRIyhyceoz/nuFV5at2MXOSr/SktdA6+9lbJqGUmsykxNINbRZnJu5cNdwABTVKgfAxCo8QR9mNRZWVX2ukkzSAVWRswW/EoLmtK29bSWcuPadWU0adhPxK72aZRZv3xPWECxM1SuVturzYkjvIzrMPspWwOwcxidygY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Idku6B1W; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a089511f9so15353817b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2024 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610581; x=1718215381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=Idku6B1WbjWlNIoVZa3HVC6dG1gQ0a7HXAXah4JvpCOQTPgCUCAELnQUNb9/wosw+t
         yhTRct0vZJQ8OSqH5KPEIubSLF5rVAj1uqISQrHjuRVlM6HT/ZYbuFASEfFsS2JqabVf
         ydM9kdda7TDVtg7RPmBgAe58t94ZiU4P7gdrZ/zvLuxwAh3KNoNY9XqgkYxgn9siwYU2
         r03213d0SDy/RCqasY/K9TwS/wg4MMfe8NIvc7lWlB6pgbv/jYWasckvgYwd34B3CNQZ
         XCOK5SIFmd+94r3xNhyeW9vWwGp6HMd4Id7m+C4bZ+xuvE3VkAS8EC7zJQXikJRsPbTc
         NE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610581; x=1718215381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=pVNt/SOOEMP3qjJDb5hofprZIXhj7MXOlvMz7YViruN3LeUlzEZLIJasulbxLgqxgz
         egMZ3T4vp5Oxy8HY03vZ02cujT30AxMcCw1ThF7Pz4arLMgSAl9uq4GgOPO7h8XFgEhU
         qBPl+cjq4Y4SiPdsYlRVybZj3GRCYIopuIwAwt1z+5pEZYKYl2H8f6vr7U960WQdQ6gr
         my+Zz0ajJUovkD/CaIahWulAjfTY41Pz553L4SE41RP52PHahzIulZnsauls8Si+v3Zl
         E0+o7AIKkmf5WZww63Tz37pXItMTYWoTprdn1loGBKWj+vjS9b/eG/V0OMriegCzVP4o
         U3bA==
X-Forwarded-Encrypted: i=1; AJvYcCXSp/4y8N3mBFwcZrG+b+SE/dv1fbsieagMce9aUesDGB0/2+zy+CV6nw6E2PGezpsPfTAH+iZMCAJpFvFnd2GWyQ7sEOwYHl7VOKY=
X-Gm-Message-State: AOJu0Yz0dGwxfe00MVgzsJOQugTP2gwY18GILGzdY0RQsIaj/uuZ9VN3
	dWCKBAcali+5KJ443qngyrSalH1TjgwnoD3XhbpT/YIqwIJJz4VzvXB2IJTQqMylWAqwFVVXn5L
	I6u4tIcsgPg==
X-Google-Smtp-Source: AGHT+IE9F8AaFWy+zkoE1AAtvE0JQ7XHHDVuIM2gnYtU9d2txGGQvOGhBI3kC4/nhW85Sx5cKDFxLERd+BeUJQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:110c:b0:df7:9274:34e1 with SMTP
 id 3f1490d57ef6-dfadeb57766mr87616276.4.1717610581556; Wed, 05 Jun 2024
 11:03:01 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:35 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-5-joychakr@google.com>
Subject: [PATCH v1 14/17] thunderbolt: switch: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/thunderbolt/switch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 326433df5880..35424a65cd3a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -301,7 +301,7 @@ int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 	return dma_port_flash_read(sw->dma_port, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -321,10 +321,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -342,7 +342,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&sw->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_switch_nvm_add(struct tb_switch *sw)
-- 
2.45.1.467.gbab1589fc0-goog


