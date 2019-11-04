Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3669AED703
	for <lists+linux-tegra@lfdr.de>; Mon,  4 Nov 2019 02:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbfKDBiH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Nov 2019 20:38:07 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43123 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbfKDBiH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Nov 2019 20:38:07 -0500
Received: by mail-lj1-f194.google.com with SMTP id y23so4855609ljh.10
        for <linux-tegra@vger.kernel.org>; Sun, 03 Nov 2019 17:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i647Q9NPLFm34sW7oYvZoFHC+Yy43qYER+sibvHRJso=;
        b=JWXSa3MyVXWpe/WcxH0bVKxOnzVohai45paLGphAyXjr+SBJ91aAR8wWocp/RYS8tk
         2YRv2Vnsl4z2qu7+CpzKu15Nlyx4+sHQXvkLA8/YdcMs0n+SmVpi+hBvexE86X4ALcOp
         tulte1kIG9egxuD+BdeTGZ3mWflG1+6ymtSfuiGUaodwQG5pSQdnxj+tNZLfdx9QigD4
         tFHHrMGuc9CdNuzrY11NAty38CAXbzCsK1bg1bpw2aWAjNrEgniZXGfbPVzzTKEJxucd
         mJWzQQ64z9Y13jsUISJljmQGy5zKd392HL0CFIC+gpZaNxc0Vb84DHPPtH/rGt/wiEe9
         9yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i647Q9NPLFm34sW7oYvZoFHC+Yy43qYER+sibvHRJso=;
        b=nUPqBAENYiBONGljgT/4tXceEe7K3rovC991iexTlwmU9cCo2WJ8h9pYRfRAAQ95MK
         FKu2IAnIHcaWRvX+UWRj/cXMVpYnFsZm65AH06rwKZKgVYPZvBhdahwRWEo9nxdO12Ae
         5OQxKq2owdJ36GFi6oSAcnjVyzaucCclNfC6yZGTe0YiOhqGKc2woW4ldbkEgX/g9fc9
         MmTW5SREsTK2hTbIAhyVtoQC9ElqNy+WF0GstGMuONf50p2Qi8Y7c2uigLn4wg8SqjFl
         8sQKlJARJBjbBkSJQUfMAGuceihhMmR72YlKpCUbVDLcCs39bWJCi8Gn60BrsIX/eyqt
         sjhQ==
X-Gm-Message-State: APjAAAXXZs9Y7EJ0p/F6QjOzeWnkhKun/3CrupfrhV/qinAcH30nLeGC
        IioXWVTIpxBJsTPINqJfqTv1AQ==
X-Google-Smtp-Source: APXvYqykbpP5eQGEXUMZmmiA0tqpyBW/fPm07hUEAWdMesGBV0yZUlzMN5L4qLEV7Fgx62t4tnbJcQ==
X-Received: by 2002:a2e:858d:: with SMTP id b13mr14965413lji.71.1572831485199;
        Sun, 03 Nov 2019 17:38:05 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 4sm6195236ljv.87.2019.11.03.17.38.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2019 17:38:04 -0800 (PST)
Date:   Sun, 3 Nov 2019 17:33:15 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/8] memory: tegra: Changes for v5.5-rc1
Message-ID: <20191104013315.isc5ktgxgnnqlvrg@localhost>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
 <20191102144521.3863321-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102144521.3863321-3-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Nov 02, 2019 at 03:45:16PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory
> 
> for you to fetch changes up to 8b04225c4464422f185e62c2cedfb9e234423814:
> 
>   memory: tegra: Consolidate registers definition into common header (2019-11-01 10:57:37 +0100)

Hi, sitting on this one for a few days to make sure the shared contents lands
in the clk tree unmodified.


-Olof
