Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79CF137AAA
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgAKAgM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:12 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38669 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbgAKAgM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:12 -0500
Received: by mail-wm1-f67.google.com with SMTP id u2so3800085wmc.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJ/kMGVDSllyNMBMZ6FICn2DJm9xwwWpuLKmv3girkw=;
        b=nqn0/JTQ4Pral6SaL5i2zIuv4kOqmhZZTUTtHAukh9VoFN92dnDCpM2EavqOH/4itj
         4NGxEOvrvs+XiHFOGDkZq2DeHiSlxAX14ipeLZ/amiNcEvHypiNOinr2SARzsOvqy3kC
         fOa/aO+a4exiY/LZCrISoo0t/h/CLUOiBU+im8pzR+w1h3hWxyOIS1fy7nAKz9aZ5fAm
         4h6a8fGIAtbuRUf79EB680hEgJa9FTSM8eoqiUl6nchqV/ZaKTXutkRUHvwYLKjs+4GM
         P6dGo0VPbAzz5dNMz7+blP9UVA1hTaKGBnLHh7LyDjd5Kgvi9VRULv/3ens2O6cKIny9
         jd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJ/kMGVDSllyNMBMZ6FICn2DJm9xwwWpuLKmv3girkw=;
        b=p5owoPnM2B4Mx9tZetMuoACImLFWg5xkS9gdpE9E2QFra81E8M8mBg+XGxqf7EG7Wg
         mm9nfP1x/K15Pz59j1EPO5EQuWa82Z4SM1GJ9KsTgcz8osd7icWBZz5ICoXhYx303qnY
         td3GNz1s0CZkBs0EsUBaizjpFtc6hgQ5ehHbwvtAFy8nqPGSwN8ipBIunObFxWOlz259
         UHrcD0G5RdVx5Fnok/1ZXzGuMDqG514s34D8HaHypdAx5llcv4to67MTWMfXJLrPXUvL
         leWz5scDCjbH7XfsUIXlAdbc8hXKyslFjQi9GPXO3/mYdJbO5tPveZMIXIHxYtHTy3L+
         RhZg==
X-Gm-Message-State: APjAAAVZ0rJCtTvXhRNsp0avp6iyWFCgLs4aMMgwACMNP7USfiYnlpj6
        p6yO+6cU50nC89xUTHlZRh3z5z44
X-Google-Smtp-Source: APXvYqzQhxYn4MDQYfkvzlfpMW3Ab0vNF7NvhJB8OLTdqYx34ccECCEeKPoI7OHwXsvu4WocIGXg2Q==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr6935237wme.82.1578702970469;
        Fri, 10 Jan 2020 16:36:10 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id i5sm4181787wrv.34.2020.01.10.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:09 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] dt-bindings: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:53 +0100
Message-Id: <20200111003553.2411874-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm64-defconfig

for you to fetch changes up to ddb8840d2777bfca7c9ebc8c24ea20f9a37145ba:

  arm64: defconfig: Enable tegra XUDC support (2020-01-10 18:34:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.6-rc1

This contains a conversion of the Tegra124 EMC bindings to json-schema
as well as the addition of the bindings for the memory subsystem found
on Tegra186 and Tegra194.

----------------------------------------------------------------
Nagarjuna Kristam (1):
      arm64: defconfig: Enable tegra XUDC support

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
