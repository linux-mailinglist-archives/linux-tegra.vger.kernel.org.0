Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583B6BABFE
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Sep 2019 00:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbfIVWbi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Sep 2019 18:31:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45263 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729612AbfIVWbh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Sep 2019 18:31:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id 4so6818741pgm.12
        for <linux-tegra@vger.kernel.org>; Sun, 22 Sep 2019 15:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=gKQf29wHUne7HHUcaKWuvokQuQFXQ6ewB4zZKn2Wb8A=;
        b=rxIoHHOuPAHiex0ATA3NwAkvdUDhn398Gw9ANyEwEQTp3jFRq47IIqRBnvAarmvOhm
         QriLpOeHJRbKP/RkxgfCl2w+6IBXY5HbuRA2eMy0Id0mVfsHM5wPdS5N0aNUs8iGnKiN
         bAJVWrmeHu5sSKJXSS8GevJDXAOEo/5h+WfZK3XRTBjGD8eqDsKvLljnvizbcqyhEuVD
         gyz6LEyRcl9+IzQNaBR1B5VErLFF8ThF0pRZAdN15A9DIPo80SKYRQtL8JL0rAKhq0lz
         Va9/ySEc1rpn0TZj/JmqSUIpoPjRSIuZUZuDwV354ragUKcHae92QjjHMHt/4Wo7rKQ2
         bWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=gKQf29wHUne7HHUcaKWuvokQuQFXQ6ewB4zZKn2Wb8A=;
        b=dtvC8ljjXes8CQOW8dCHi07fXToDBjRYNBAANQDJvjCmu9PqKCWvhI4mBkX144qb5q
         axrL4ougA+CaxGvmQwsQjP5uPnIkHuwz5mKjxrLH8+9gscN3FTQZqQvyRtOAdk2L8E5z
         MblCxXDmuOk1sNLYbX/ZLuo6mJzt+JeOHUogscUJVyl1o+KWqqk4YwlqMaXUHQaQyDb7
         MOfj72rPvGpLJT88yBdN0AqRgDjAM8ZAvBSbTQhR4skc0hANGbYZb+0PMUJjkBkpI7o3
         6RSaHj2O7sZH535ji2Jrcc8zP8T04jpoO6l4NivG4l4Pdvv+OwPNeZkXdlu95KN0RdNM
         TJHw==
X-Gm-Message-State: APjAAAVLETdU2ltB6L/MGQKchCfP2oU9H5NHEcNsz7UGpDPnu9Wr2Iyb
        SdWx269Rnkoy1hk734T0TawXiQ==
X-Google-Smtp-Source: APXvYqx7KKQS2DvlD5zTbylJ6r5f5totuAKe8v107VUjOM7io2MFqQ3bchgOHBIhHyy5gWEpVsWntw==
X-Received: by 2002:a63:c09:: with SMTP id b9mr25936584pgl.245.1569191495395;
        Sun, 22 Sep 2019 15:31:35 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id x6sm10770768pfd.53.2019.09.22.15.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 15:31:35 -0700 (PDT)
Date:   Sun, 22 Sep 2019 15:31:32 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Fix page pool size
Message-ID: <20190922153132.0c328fe7@cakuba.netronome.com>
In-Reply-To: <20190920170127.22850-1-thierry.reding@gmail.com>
References: <20190920170127.22850-1-thierry.reding@gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 20 Sep 2019 19:01:27 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The size of individual pages in the page pool in given by an order. The
> order is the binary logarithm of the number of pages that make up one of
> the pages in the pool. However, the driver currently passes the number
> of pages rather than the order, so it ends up wasting quite a bit of
> memory.
> 
> Fix this by taking the binary logarithm and passing that in the order
> field.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Since this is a fix could we get a Fixes tag pointing to the commit
which introduced the regression?
