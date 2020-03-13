Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E36184D15
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCMQ67 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:58:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39834 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ67 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:58:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id r15so13027514wrx.6
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ZtpoizzVl8pdp804KeThlDclE0eGVD9drg6pWo+El0=;
        b=i2UGQ1SGbp+mel+QVnxrd0VCpoXiF55ypqwakm/eQQbgmGxhx07CJfHqLNHyNIvtoV
         IV9bqbnyszCY2aR9wMUjjaqxjy9w0gpvOk7k0Qjh3PL6D0jJ2UyX6xHIoQnidbmtL8IO
         lDa6RNLzenkQeRXCm0XSfRHx5YvUzTTVuHuIkNm+sfijHu9zxlP/DIS8lr8qICoEKwBZ
         3e43N1OEC+7MXCQNjXNN0xdKNxzjrh3KVUC9eHdrnB6/fIfyN8k1XxWkm7829IA06t9T
         rQm7VzFUrwBv6KlJz5kZMXm+iDR9Yiq9YEpVPOVLKisQknGymGbMfwHfgZ38FGeZr3L0
         lPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ZtpoizzVl8pdp804KeThlDclE0eGVD9drg6pWo+El0=;
        b=eq832rcC5jsdtmHiEnHoNPjyTvybN7ekMYOphNUqnQCcMss6LXv3TItZmlTHLhSHbs
         NU4ll4Gxe5JHcgFMV1Dy2+KURcuW7ZydLjP0u1vliASYG5DvStpxOdGfeW9K6hOsRZx9
         WH9Ht+bxBOWi8itDEwaw+UuD6m4S8tb+hrpYJc/5vw3kw8e/JkVYeKXH3QkDZUrRuOeP
         LdYEfGpUy4an6R47OJavLlU405gh8JBg/TNCkrwzWclF82WyyaJFMRpr4jc43HDIRxDe
         mrGuv8BkGWDCy/vM3vr0v80LuH1Ayc3p0769/eqKxu9YTDAoX43+zVi+zYOuksFySyXr
         nHfQ==
X-Gm-Message-State: ANhLgQ09zC5Kc7UfexEaPbeXfkkch9jTmAzkQcTsJi/uOPnMeMtiK6Xt
        zQxWluJLZFjPDW+0hwNvMB0=
X-Google-Smtp-Source: ADFU+vtsHX4RwxjvrPuT7ImBThVXBi88Xy6BlRSWICD+LYdJ3D0XlIlkc1TQjIoSeYskz83SR9L3Yg==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr19317886wrn.326.1584118737923;
        Fri, 13 Mar 2020 09:58:57 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id t187sm18276952wmt.25.2020.03.13.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:58:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 02/10] firmware: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:40 +0100
Message-Id: <20200313165848.2915133-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-firmware

for you to fetch changes up to 6c2d3a14b7aff13f74fb2331d9a54202c66bea4d:

  firmware: tegra: Fix a typo in Kconfig (2020-02-17 08:54:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.7-rc1

A trivial typofix for the Kconfig entry of the Tegra IVC library.

----------------------------------------------------------------
Christophe JAILLET (1):
      firmware: tegra: Fix a typo in Kconfig

 drivers/firmware/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
